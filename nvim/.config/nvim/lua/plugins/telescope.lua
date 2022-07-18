local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
  return
end

telescope.load_extension("fzf")
telescope.load_extension("project")

local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
        preview_cutoff = 200,
      },
      vertical = {
        mirror = false,
        width = 180,
        height = 60,
      },
      bottom_pane = {
        height = 50,
      },
    },
    file_sorter = sorters.get_fuzzy_file,
    file_ignore_patterns = {
      ".git/*",
      "node_modules/*",
      "bower_components/*",
      ".svn/*",
      ".hg/*",
      "CVS/*",
      ".next/*",
      ".docz/*",
      ".DS_Store",
    },
    generic_sorter = sorters.get_generic_fuzzy_sorter,
    winblend = 20,
    border = {},
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ["COLORTERM"] = "truecolor" },
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    project = {
      base_dirs = {
        "~/repos",
      },
    },
  },
})
