" Start plugin manager
execute pathogen#infect()

set nocompatible
set hlsearch
set number
set mouse=a
set ttymouse=xterm2
set nowrap

" Spaces and tabs
set autoindent
set expandtab
set smarttab
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
if has("autocmd")
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 et
endif

" Configure 256 colors for xterm mode
if ! has('gui_running')
    let g:solarized_termcolors=256
    set t_Co=256
endif

syntax on
filetype on
filetype plugin on
filetype plugin indent on
syntax enable

" Disable syntax highlight in diff mode
au FilterWritePre * if &diff | set syntax=off | endif
au FilterWritePost * if &diff | set syntax=on | endif
