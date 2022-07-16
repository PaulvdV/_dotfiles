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
    keymaps = {
      -- mappings for incremental selection (visual mappings)
      init_selection = "gnn", -- maps in normal mode to init the node/scope selection
      node_incremental = "k", -- increment to the upper named parent
      scope_incremental = "grc", -- increment to the upper scope (as defined in locals.scm)
      node_decremental = "K", -- decrement to the previous node
    },
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
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd", -- mapping to go to definition of symbol under cursor
        list_definitions = "gnD", -- mapping to list all definitions in current file
      },
    },
  },
  textobjects = {
    -- syntax-aware textobjects
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["aC"] = "@class.outer",
        ["iC"] = "@class.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",
        ["ae"] = "@block.outer",
        ["ie"] = "@block.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["is"] = "@statement.inner",
        ["as"] = "@statement.outer",
        ["ad"] = "@comment.outer",
        ["am"] = "@call.outer",
        ["im"] = "@call.inner",
      },
    },
  }, 
})
