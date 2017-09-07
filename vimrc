" colors
syntax enable

" Spaces & tabs
set tabstop=4
set softtabstop=4
set expandtab

" UI
set number
set showcmd
set cursorline
filetype indent on
set wildmenu
set lazyredraw
set showmatch

" Searching
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" Movement
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
nnoremap gV `[v`]

" Leader shortcuts
let mapleader=","
nnoremap <leader>s :mksession<CR>

