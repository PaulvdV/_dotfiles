local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_ok then
  return
end


treesitter.setup({
  ensure_installed = "all", -- one of "all", "language", or a list of languages
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = false,
  },
  refactor = {
    highlight_definitions = {
      enable = true,
    },
    highlight_current_scope = {
      enable = false,
    },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr", -- mapping to rename reference under cursor
      },
    },
  },
  textobjects = {
    -- syntax-aware textobjects
    enable = true,
  },
})
