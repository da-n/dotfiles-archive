" Load Pathogen
filetype off
execute pathogen#infect()
syntax on
filetype plugin indent on

" We don't need Vi compatibility
set nocompatible

" We don't need modelines
set modelines=0

" Change the <leader> to ,
let mapleader = ","

" Color scheme
syntax enable
colorscheme molokai
let g:rehash256 = 1
let g:molokai_original = 1
set background=dark

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Indent settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
        
" General settings
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set undofile

" Wrap at 80 chars
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" Disabled the arrow keys, do it correctly
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
" nnoremap j gj
" nnoremap k gk

" NERDTree
" autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
