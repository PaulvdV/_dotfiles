set encoding=utf8

set number
set relativenumber

set nowrap
set nohlsearch

set signcolumn=yes
set colorcolumn=100

set updatetime=50
set cmdheight=2
set laststatus=2

set scrolloff=8

call plug#begin()

Plug 'dracula/vim'
Plug 'ryanoasis/vim-devicons'

call plug#end()

colorscheme dracula
set tgc


" Mappings
let g:mapleader="\<space>"
let g:maplocalleader="\\"
