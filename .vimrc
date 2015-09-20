" https://github.com/VundleVim/Vundle.vim
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on

" indentation
set softtabstop=2
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent

" color
syntax enable
set background=dark
colorscheme solarized

" 80 column mark
set textwidth=80
set colorcolumn=+1

" show info
set showmode
set showcmd
set ruler
set number

" highlight
set cursorline
set hlsearch
set showmatch

" other
set visualbell
set backspace=2
set incsearch
set nocompatible

" https://robots.thoughtbot.com/faster-grepping-in-vim
set grepprg=ag\ --nogroup\ --nocolor
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

" tree style file explorer
let g:netrw_liststyle=3
