local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  Packer_Bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

return packer.startup(function()
  use({
    "wbthomason/packer.nvim",
    "lewis6991/impatient.nvim",

    "dracula/vim",
    "kyazdani42/nvim-web-devicons",
    "nvim-lualine/lualine.nvim",
    "folke/which-key.nvim",

    "pacha/vem-tabline",
    "mhinz/vim-sayonara",
  })

  use({
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",

    "jose-elias-alvarez/null-ls.nvim",
    "neovim/nvim-lspconfig",
    "tamago324/nlsp-settings.nvim",
    "williamboman/nvim-lsp-installer",
  })

  use({
    "tpope/vim-commentary",
    "tpope/vim-surround",
    "tpope/vim-repeat",
    "tpope/vim-speeddating",
    "tpope/vim-fugitive",
  })

  use({
    "nvim-treesitter/nvim-treesitter",  run = ":TSUpdate",
    requires = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { "nvim-treesitter/nvim-treesitter-refactor" },
    }
  })

  use({
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-lua/popup.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      { "nvim-telescope/telescope-project.nvim" },
    }
  })

  use({
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({
        timer = {
          spinner_rate = 40,
          fidget_decay = 0,
          task_decay = 0,
        },
      })
    end,
  })
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        numhl = true,
        yadm = { enable = false },
      })
    end,
  })
  use({
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({})
    end,
  })
  use({
    "rrethy/vim-hexokinase",
    run = "make hexokinase"
  })

  -- Automatically setup config after cloning packer
  if Packer_Bootstrap then
    require("packer").sync()
  end
end)
