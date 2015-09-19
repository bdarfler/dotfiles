set softtabstop=2
set tabstop=2
set shiftwidth=2
set showmode
set showmatch
set smarttab
set expandtab
set autoindent
set nocompatible
set ruler
set incsearch
set background=dark
set hlsearch
set backspace=2
set number

execute pathogen#infect()
syntax on
filetype plugin indent on

set runtimepath^=~/.vim/bundle/ctrlp.vim

map <C-n> :NERDTreeToggle<CR>
