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

" backup to ~/.vim-tmp 
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Enable mouse use in all modes
set mouse=a

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2
