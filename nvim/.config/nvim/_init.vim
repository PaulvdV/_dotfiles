
call plug#begin()
Plug 'lewis6991/impatient.nvim'

Plug 'dracula/vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-fugitive'

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-refactor'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-project.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'j-hui/fidget.nvim'

Plug 'lewis6991/gitsigns.nvim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
call plug#end()

colorscheme dracula
set tgc
set pb=20
set winblend=20


" Mappings
let g:mapleader=" "

" Use lua filetype
let g:do_filetype_lua = 1
let g:did_load_filetypes = 0

lua require("impatient")
lua require("treesitter-conf")
lua require("telescope-conf")
lua require("bar-conf")
lua require("gitsigns").setup({keymaps = {noremap=false}})
