" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ Vundle Plugins ===================

call plug#begin('~/.vim/bundle')

Plug 'ctrlpvim/ctrlp.vim'                        " Fuzzy file, buffer, mru, tag, etc finder
Plug 'JazzCore/ctrlp-cmatcher'                   " Better fuzzy finding
Plug 'mileszs/ack.vim'                           " Vim plugin for the Perl module / CLI script 'ack'
Plug 'derekwyatt/vim-scala'                      " Scala syntax highlighting
Plug 'altercation/vim-colors-solarized'          " precision colorscheme for the vim text editor
Plug 'ntpeters/vim-better-whitespace'            " highlight all trailing whitespace characters
Plug 'vim-airline/vim-airline'                   " lean & mean status/tabline for vim
Plug 'vim-airline/vim-airline-themes'            " A collection of themes for vim-airline
Plug 'bling/vim-bufferline'                      " show the list of buffers in the command bar
Plug 'airblade/vim-gitgutter'                    " shows a git diff in the gutter
Plug 'godlygeek/tabular'                         " vertical alignment

call plug#end()

" ================ General Config ===================

set autoread                                     " Reload files changed outside vim
set history=1000                                 " Store lots of :cmdline history
set hidden                                       " Leave hidden buffers open
set clipboard=unnamed                            " Allow vim to use the system clipboard
set mouse=a                                      " Enable mouse support
set spelllang=en_us                              " Set spelling for US english

set nobackup                                     " no backup files
set nowritebackup                                " no backup file while editing
set noswapfile                                   " no swap files

set wildmenu                                     " Better command-line completion
set wildmode=list:longest                        " List matches, complete longest common string

set incsearch                                    " Find the next match as we type the search
set hlsearch                                     " Highlight searches by default
set ignorecase                                   " Ignore case when searching...
set smartcase                                    " ...unless we type a capital

set backspace=2                                  " Allow backspace in insert mode
set scrolloff=8                                  " Scroll when 8 lines away from edge

set autoindent                                   " Copy indent from current line when starting a new line
set smartindent                                  " Enable smart indent
set smarttab                                     " Enable smart tabs
set shiftwidth=2                                 " Number of auto-indent spaces
set softtabstop=2                                " Number of spaces per tab while editing
set tabstop=2                                    " Number of spaces per tab in a file
set expandtab                                    " Use spaces instead of tabs

set grepprg=rg\ --vimgrep\ --no-heading          " Use rg for grepping

autocmd FileType gitcommit setlocal spell        " Enable spelling in gitcommits

" ================ Visual Config =====================

set visualbell                                   " Visual alerts, not sounds

set cursorline                                   " Highlight the current line
set showmatch                                    " Highlight matching braces
set colorcolumn=120                              " Highlight column width guide

set number                                       " Show line numbers
set relativenumber                               " Show relative line numbers

set splitbelow                                   " Split below for horizontal splits
set splitright                                   " Split right for vertica splits

set showcmd                                      " Show incomplete cmds at the bottom
set ruler                                        " Show column and line at the bottom
set laststatus=2                                 " Show status line
set noshowmode                                   " Hide current mode at the bottom

syntax enable                                    " Enable syntax coloring
set background=dark                              " Enable dark background colors
colorscheme solarized                            " Enable solarized colorscheme

" Set Font
set guifont=Source\ Code\ Pro\ for\ Powerline:h14

" ================ netrw Config ======================
" https://shapeshed.com/vim-netrw/

let g:netrw_banner = 0                           " Disable banner information
let g:netrw_liststyle = 3                        " Tree style listing
let g:netrw_browse_split = 4                     " Open files in the previous window
let g:netrw_altv = 1                             " Split files to the right window
let g:netrw_winsize = 15                         " Set window size to 15 cols

" At launch, open netrw and navigate out of it
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Lexplore
  autocmd VimEnter * wincmd p
augroup END

" ================ Plugins Config ====================

let g:bufferline_echo = 0                        " Do not echo buffers to the command bar
let g:airline_powerline_fonts = 1                " Use powerline fonts in airline

" Use better matching function for ctrlp
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_use_caching = 0                      " Disable caching for ctrlp
let g:ctrlp_user_command = 'rg --files  %s'      " Use rg for ctrlp

" Use rg for ack.vim
let g:ackprg = 'rg --smart-case ---vimgrep --no-heading'

" ================ Custom Mapings ====================

" Set leader to space
let mapleader=" "

" Mappings for Plugins
nnoremap <leader>f :Ack<Space>
nnoremap <leader>a :Tabularize<Space>
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>ws :StripWhitespace<CR>
nnoremap <leader>t :Lexplore<CR>

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
