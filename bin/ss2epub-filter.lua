-- Pandoc Lua filter that strips Substack-email chrome.
-- Loaded by bin/ss2epub via --lua-filter.
--
-- Two-pass filter:
--   1. Scope the document to Substack's <div class="post typography">
--      wrappers (post-header + article body).
--   2. Drop chrome images/links/tables/spans by URL pattern or class,
--      unwrap <h1><a>...</a></h1>, and strip inline email CSS.

local function src_matches_chrome(src)
  src = src or ""
  local decoded = src:gsub("%%2F", "/"):gsub("%%2f", "/")
  local patterns = {
    "eotrx%.substackcdn%.com",   -- email tracking pixel
    "substack%.com/icon/",       -- Lucide UI icons
    "substack%.com/img/email/",  -- "READ IN APP", publish-button, etc.
    "_400x400%.png",             -- author avatar
  }
  for _, p in ipairs(patterns) do
    if decoded:find(p) then return true end
  end
  return false
end

local CHROME_TEXT = { ["view in browser"] = true, ["read in app"] = true }

local CHROME_CLASSES = {
  "email%-button%-",      -- "READ IN APP", spacer, outline
  "post%-meta",           -- byline metadata bars
  "post%-ufi",            -- like/comment/share UI
  "subscription%-widget", -- inline subscribe CTA
  "comments?%-cta",       -- comments call-to-action
  "^preview$",            -- email-client preview-pane spacer text
}

local function has_chrome_class(classes)
  for _, c in ipairs(classes or {}) do
    for _, p in ipairs(CHROME_CLASSES) do
      if c:find(p) then return true end
    end
  end
  return false
end

-- Pass 1: narrow to <div class="post typography">. Unwrap one extra Div
-- level so pandoc's EPUB writer doesn't split each Div into a chapter.
local scope_to_article = {
  Pandoc = function(doc)
    local collected = {}
    doc:walk({
      Div = function(d)
        local has_post, has_typ = false, false
        for _, c in ipairs(d.classes) do
          if c == "post" then has_post = true end
          if c == "typography" then has_typ = true end
        end
        if has_post and has_typ then
          for _, child in ipairs(d.content) do
            if child.t == "Div" then
              for _, b in ipairs(child.content) do
                table.insert(collected, b)
              end
            else
              table.insert(collected, child)
            end
          end
        end
      end
    })
    if #collected > 0 then doc.blocks = collected end
    return doc
  end,
}

-- Pass 2: strip chrome + inline styles inside the scoped article.
local strip_chrome = {
  Image = function(el)
    if src_matches_chrome(el.src) then return {} end
    el.attr = pandoc.Attr()
    return el
  end,

  Link = function(el)
    local text = pandoc.utils.stringify(el.content):lower()
    if CHROME_TEXT[text] then return {} end
    if has_chrome_class(el.classes) then return {} end
    if #el.content == 0 then return {} end
    el.attr = pandoc.Attr()
    return el
  end,

  Span = function(el)
    if has_chrome_class(el.classes) then return {} end
    el.attr = pandoc.Attr()
    return el
  end,

  Div = function(el)
    if has_chrome_class(el.classes) then return {} end
    el.attr = pandoc.Attr()
    return el
  end,

  Table = function(el)
    if has_chrome_class(el.classes) then return {} end
    local out = {}
    for _, row in ipairs(el.bodies[1] and el.bodies[1].body or {}) do
      for _, cell in ipairs(row.cells) do
        for _, block in ipairs(cell.contents) do
          table.insert(out, block)
        end
      end
    end
    for _, row in ipairs(el.head.rows or {}) do
      for _, cell in ipairs(row.cells) do
        for _, block in ipairs(cell.contents) do
          table.insert(out, block)
        end
      end
    end
    return out
  end,

  Para = function(el)
    if #el.content == 0 then return {} end
  end,

  Header = function(el)
    if #el.content == 1 and el.content[1].t == "Link" then
      el.content = el.content[1].content
    end
    el.attr = pandoc.Attr()
    return el
  end,

  Block = function(el)
    if el.attr then el.attr = pandoc.Attr() end
    return el
  end,
}

-- Pass 3: insert an italic "Author · Date" byline paragraph right after
-- the first level-1 Header. Runs after strip_chrome so the freshly
-- inserted paragraph isn't itself unwrapped or dropped.
local inject_byline = {
  Pandoc = function(doc)
    local function metastr(k)
      return doc.meta[k] and pandoc.utils.stringify(doc.meta[k]) or ""
    end
    local parts = {}
    local author = metastr("author")
    local date = metastr("date")
    if author ~= "" then table.insert(parts, author) end
    if date ~= "" then table.insert(parts, date) end
    if #parts == 0 then return doc end
    local byline = pandoc.Para({
      pandoc.Emph({ pandoc.Str(table.concat(parts, " · ")) }),
    })
    for i, block in ipairs(doc.blocks) do
      if block.t == "Header" and block.level == 1 then
        table.insert(doc.blocks, i + 1, byline)
        break
      end
    end
    return doc
  end,
}

return { scope_to_article, strip_chrome, inject_byline }
