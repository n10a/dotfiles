set nocompatible
set hlsearch
set number
set mouse=a
set ttymouse=xterm2
set nowrap

set autoindent
set expandtab
set smarttab
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4

"configure 256 colors for xterm mode
if &term =~ "xterm"
  let &t_Co=256
endif

syntax on
filetype on
filetype plugin on
filetype plugin indent on
syntax enable

" Start plugin manager
execute pathogen#infect()

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ignore_files = [
    \ '/home/sasha/lab/.*',
    \ '/home/sasha/pyrfc/.*',
    \ '/usr/share/mobsap/sys/repo/.*',
    \ '/home/sasha/lab_c_client/.*',
    \ '/usr/lib/.*',
    \ '.*\.c']

