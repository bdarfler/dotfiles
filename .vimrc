" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ Vundle Plugins ===================

call plug#begin('~/.vim/bundle')

Plug 'ctrlpvim/ctrlp.vim'                                  " Fuzzy file, buffer, mru, tag, etc finder
Plug 'JazzCore/ctrlp-cmatcher'                             " Better fuzzy finding
Plug 'derekwyatt/vim-scala'                                " Scala syntax highlighting
Plug 'altercation/vim-colors-solarized'                    " precision colorscheme for the vim text editor
Plug 'vim-airline/vim-airline'                             " lean & mean status/tabline for vim
Plug 'vim-airline/vim-airline-themes'                      " A collection of themes for vim-airline
Plug 'bling/vim-bufferline'                                " show the list of buffers in the command bar
Plug 'airblade/vim-gitgutter'                              " shows a git diff in the gutter
Plug 'godlygeek/tabular'                                   " vertical alignment
Plug 'majutsushi/tagbar'                                   " displays tags in a window

call plug#end()

" ================ General Config ===================

set autoread                                               " Reload files changed outside vim
set history=1000                                           " Store lots of :cmdline history
set hidden                                                 " Leave hidden buffers open
set clipboard=unnamed                                      " Allow vim to use the system clipboard
set spelllang=en_us                                        " Set spelling for US English

set nobackup                                               " no backup files
set nowritebackup                                          " no backup file while editing
set noswapfile                                             " no swap files

set wildmenu                                               " Better command-line completion
set wildmode=list:longest                                  " List matches, complete longest common string

set incsearch                                              " Find the next match as we type the search
set hlsearch                                               " Highlight searches by default
set ignorecase                                             " Ignore case when searching...
set smartcase                                              " ...unless we type a capital

set backspace=2                                            " Allow backspace in insert mode
set scrolloff=8                                            " Scroll when 8 lines away from edge

set autoindent                                             " Copy indent from current line when starting a new line
set smartindent                                            " Enable smart indent
set smarttab                                               " Enable smart tabs
set shiftwidth=2                                           " Number of auto-indent spaces
set softtabstop=2                                          " Number of spaces per tab while editing
set tabstop=2                                              " Number of spaces per tab in a file
set expandtab                                              " Use spaces instead of tabs

set grepprg=rg\ --vimgrep\ --no-heading                    " Use rg for grepping

" ================ Visual Config =====================

set visualbell                                             " Visual alerts, not sounds
set showbreak=↪                                            " Visually distinguish wrapped lines

set cursorline                                             " Highlight the current line
set showmatch                                              " Highlight matching braces
set colorcolumn=120                                        " Highlight column width guide

set number                                                 " Show line numbers
set relativenumber                                         " Show relative line numbers

set splitbelow                                             " Split below for horizontal splits
set splitright                                             " Split right for vertical splits

set showcmd                                                " Show incomplete cmds at the bottom
set ruler                                                  " Show column and line at the bottom
set laststatus=2                                           " Show status line
set noshowmode                                             " Hide current mode at the bottom

syntax enable                                              " Enable syntax coloring
set background=dark                                        " Enable dark background colors
colorscheme solarized                                      " Enable solarized colorscheme

set guifont=Source\ Code\ Pro\ for\ Powerline:h14          " Set Font

" ================ netrw Config ======================

let g:netrw_banner          = 0                            " Disable banner information
let g:netrw_mousemaps       = 0                            " Disable mouse maps
let g:netrw_liststyle       = 3                            " Tree style listing
let g:netrw_winsize         = -30                          " Set absolute window size

" an unscientific attempt to prevent zombie
" buffers that netrw occasionally creates
let g:netrw_menu            = 0                            " Disable the menu
let g:netrw_use_errorwindow = 0                            " Do not use an error window
let g:netrw_fastbrowse      = 2                            " Do not refresh dir listings
let g:netrw_dirhistmax      = 0                            " Disable dir history

" ================ Plugins Config ====================

let g:bufferline_echo         = 0                          " Do not echo buffers to the command bar
let g:airline_powerline_fonts = 1                          " Use powerline fonts in airline

let g:ctrlp_match_func   = { 'match' : 'matcher#cmatch' }  " Use better matching function for ctrlp
let g:ctrlp_use_caching  = 0                               " Disable caching for ctrlp
let g:ctrlp_user_command = 'rg --files --hidden %s'        " Use rg for ctrlp

" ================= Open On Launch ===================

autocmd VimEnter * :TagbarOpen                             " Open tagbar
autocmd VimEnter * :Lexplore                               " Open netrw
autocmd VimEnter * wincmd p                                " Move to center panel

" ================ Custom Commands ===================

" Enable spelling in gitcommits
autocmd FileType gitcommit setlocal spell

" Grep which opens directly into quickfix window
" http://vim.wikia.com/wiki/Find_in_files_within_Vim
command! -nargs=+ Grep execute 'silent grep! <args>' | copen

" Highlight trailing whitespace
" https://github.com/ntpeters/vim-better-whitespace
" define highlight group for trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
" highlight all trailing whitespace when exiting insert mode
autocmd InsertLeave,BufReadPost * exe 'match ExtraWhitespace "\s\+$"'
" highlight all trailing whitespace except current line when in insert mode
autocmd InsertEnter,CursorMovedI * exe 'match ExtraWhitespace "\%<' . line(".") . 'l\s\+$\|\%>' . line(".") . 'l\s\+$"'

" ================ Custom Mappings ===================

" Set leader to space
let mapleader = " "

" Mappings for Plugins
nnoremap <leader>a :Tabularize<Space>/
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>t :Lexplore<CR>

" Mappings for Commands
nnoremap <leader>f :Grep<Space>
nnoremap <Leader>ws :%s/\s\+$//e<CR>

" Disable Arrow Keys
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <PageUp> <Nop>
nnoremap <PageDown> <Nop>

inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <PageUp> <Nop>
inoremap <PageDown> <Nop>

vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <PageUp> <Nop>
vnoremap <PageDown> <Nop>

" Remap for easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
