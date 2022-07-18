local g = vim.g
local opt = vim.opt
local fn = vim.fn

g.mapleader = " "

opt.autoread = true
opt.backup = false -- creates a backup file

opt.clipboard = "unnamedplus" -- don't use clipboard
opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
opt.colorcolumn = "100" -- fixes indentline for now
opt.completeopt = { "menu", "menuone", "noselect" }
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.cursorline = false -- highlight the current line

opt.expandtab = true -- convert tabs to spaces
opt.encoding = "utf-8"

opt.fileencoding = "utf-8" -- the encoding written to a file
opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding

opt.hidden = true -- required to keep multiple buffers and open multiple buffers
opt.hlsearch = false -- highlight all matches on previous search pattern

opt.ignorecase = false -- ignore case in search patterns
opt.inccommand = "nosplit"

opt.laststatus = 2 -- hide statusline
opt.listchars = "tab:│ ,trail:·,nbsp:+"
opt.list = true

opt.mouse = "a"
opt.mousemodel = "popup"

opt.number = true -- set numbered lines
opt.numberwidth = 4 -- set number column width to 2 {default 4}

opt.pumheight = 10 -- pop up menu height
opt.pumblend = 20


opt.relativenumber = true -- set relative numbered lines

opt.scrolloff = 8 -- is one of my fav
opt.shiftround = true
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.shortmess = "c"
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 2 -- always show tabs
opt.sidescrolloff = 4
opt.signcolumn = "yes" -- yes, no, number
opt.smartcase = true -- smart case
opt.smartindent = true -- make indenting smarter again
opt.smarttab = true

opt.spell = false -- disable spell checking
opt.spelllang = "en" -- language for spell checking
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.softtabstop = 2
opt.swapfile = false -- creates a swapfile

opt.tabstop = 2 -- insert 2 spaces for a tab
opt.termguicolors = false -- set term gui colors (most terminals support this)
opt.timeoutlen = 250 -- timeout length
opt.titlestring = "%<%F" -- what the title of the window will be set to
opt.title = true -- set the title of window to the value of the titlestring
opt.termguicolors = true

opt.undodir = "/tmp"
opt.undofile = true -- enable persistent undo
opt.updatetime = 50 -- faster completion

opt.wrap = false -- display lines as one long line
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
-- opt.wildignore = "/home/paul/**/node_modules/**"
opt.winblend = 20

opt.secure = true

g.netrw_liststyle = 3
g.netrw_banner = 0
