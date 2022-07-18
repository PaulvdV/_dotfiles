local g = vim.g
local opt = vim.opt

g.mapleader = " "

-- disable builtin plugins
g.loaded_2html_plugin = true
g.loaded_getscript = true
g.loaded_getscriptPlugin = true
g.loaded_gzip = true
g.loaded_logiPat = true
g.loaded_matchit = true
g.loaded_netrw = true
g.loaded_netrwFileHandlers = true
g.loaded_netrwPlugin = true
g.loaded_netrwSettings = true
g.loaded_rrhelper = true
g.loaded_tar = true
g.loaded_tarPlugin = true
g.loaded_vimball = true
g.loaded_vimballPlugin = true
g.loaded_zip = true
g.loaded_zipPlugin = true

-- options
opt.compatible = false
opt.mouse = "a"

opt.history = 10000
opt.backup = true
opt.backupdir = "/tmp//,."
opt.writebackup = false
opt.swapfile = false
opt.undodir = "/tmp//,."
opt.undofile = true
opt.undolevels = 1000
opt.undoreload = 10000
opt.updatetime = 50

opt.cursorline = true
opt.lazyredraw = false
opt.showcmd = true
opt.cmdheight = 2
opt.ruler = true
opt.completeopt = {
  "menu",
  "menuone",
  "noselect",
}

opt.scrolloff = 8
opt.sidescrolloff = 4
opt.incsearch = true
opt.inccommand = "nosplit"
opt.hlsearch = false
opt.smartcase = true
opt.ignorecase = false
opt.gdefault = true
opt.hidden = true
opt.wrap = false
opt.backspace = {
  "indent",
  "eol",
  "start",
}

opt.display = "lastline"
opt.expandtab = true
opt.smarttab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftround = true

opt.autoindent = true
opt.magic = true
opt.number = true
opt.relativenumber = true
opt.equalalways = true
opt.splitbelow = true
opt.splitright = true
opt.pumblend = 20
opt.winblend = 20
opt.pumheight = 10
opt.signcolumn = "yes"
opt.list = true
opt.listchars = {
  tab = "➞➞",
  lead = "·",
  trail = "·",
}
opt.fillchars = {
  eob = "~",
}
opt.timeout = true
opt.timeoutlen = 250
opt.ttimeoutlen = 50
opt.showtabline = 2
opt.showmode = false
opt.laststatus = 2
opt.path:append "**"
opt.shortmess:append "c"

opt.wildmenu = true
opt.wildmode = { "longest:full", "full" }
opt.wildoptions = "pum,tagfile"
opt.wildignore:append {
  "*/.git/*",
  "*/.hg/*",
  "*/.svn/*.",
  "*/.vscode/*.",
  "*/.DS_Store",
  "*/dist*/*",
  "*/target/*",
  "*/builds/*",
  "*/build/*",
  "tags",
  "*/lib/*",
  "*/flow-typed/*",
  "*/node_modules/*",
  "*.png",
  "*.PNG",
  "*.jpg",
  "*.jpeg",
  "*.JPG",
  "*.JPEG",
  "*.pdf",
  "*.exe",
  "*.o",
  "*.obj",
  "*.dll",
  "*.DS_Store",
  "*.ttf",
  "*.otf",
  "*.woff",
  "*.woff2",
  "*.eot",
}
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.autoread = true
opt.visualbell = false
opt.errorbells = false
opt.showmatch = true
opt.colorcolumn = "100"
opt.synmaxcol = 1024
opt.formatoptions = "njvcrql"
opt.joinspaces = false

opt.clipboard:append "unnamedplus" 

opt.conceallevel = 0 

opt.showmode = false 
opt.showtabline = 2 
opt.sidescrolloff = 8
opt.signcolumn = "yes" 

opt.smartindent = true 
opt.spell = false 
opt.spelllang = "en" 

opt.termguicolors = true

-- fold
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 99

opt.secure = true

g.netrw_liststyle = 3
g.netrw_banner = 0
