
call plug#begin()

Plug 'lewis6991/impatient.nvim'

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-refactor'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'xiyaowong/telescope-emoji.nvim'

Plug 'dracula/vim'
Plug 'ryanoasis/vim-devicons'

call plug#end()

colorscheme dracula
set tgc


" Mappings
let g:mapleader=" "
let g:maplocalleader="\\"

" Use lua filetype
let g:do_filetype_lua = 1
let g:did_load_filetypes = 0

lua require("impatient")
lua require("treesitter-conf")
lua require("telescope-conf")

