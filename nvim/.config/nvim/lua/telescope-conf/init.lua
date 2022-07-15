local actions = require("telescope.actions")

require("telescope").setup({
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
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        winblend = 20,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        -- borderchars = { " ", " ", " ", " ", "｢", " ", "｣", " " },
        color_devicons = true,
        use_less = true,
        path_display = {},
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
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
                "~/.config",
            },
        },
    },
})
require("telescope").load_extension("fzf")
require("telescope").load_extension("project")
require("telescope").load_extension("emoji")

function set_key_maps(mappings)
    for _, v in pairs(mappings) do
        vim.api.nvim_set_keymap(
            "n",
            "<leader>" .. v[1],
            ":lua require('telescope.builtin')." .. v[2] .. "()<cr>",
            { noremap = true, silent = true }
        )
    end
end
set_key_maps({
    { "b", "buffers" },
    { "T", "help_tags" },
    { "f", "git_files" },
    { "/", "treesitter" },
    { ";", "commands" },
    { "m", "marks" },
    { "r", "registers" },
    { "z", "spell_suggest" },
    { "c", "git_bcommits" },
    { "j", "git_status" },
    { "a", "live_grep" },
    { "g", "lsp_definitions" },
    { "e", "diagnostics" },
})
vim.api.nvim_set_keymap(
    "n",
    "<leader>p",
    ":lua require'telescope'.extensions.project.project{}<CR>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>s",
    ":lua require'telescope'.extensions.emoji.emoji{}<CR>",
    { noremap = true, silent = true }
)

local actions = require("telescope.actions")

require("telescope").setup({
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
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        winblend = 20,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        -- borderchars = { " ", " ", " ", " ", "｢", " ", "｣", " " },
        color_devicons = true,
        use_less = true,
        path_display = {},
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
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
                "~/.config",
            },
        },
    },
})
require("telescope").load_extension("fzf")
require("telescope").load_extension("project")
require("telescope").load_extension("emoji")

function set_key_maps(mappings)
    for _, v in pairs(mappings) do
        vim.api.nvim_set_keymap(
            "n",
            "<leader>" .. v[1],
            ":lua require('telescope.builtin')." .. v[2] .. "()<cr>",
            { noremap = true, silent = true }
        )
    end
end
set_key_maps({
    { "b", "buffers" },
    { "T", "help_tags" },
    { "f", "git_files" },
    { "/", "treesitter" },
    { ";", "commands" },
    { "m", "marks" },
    { "r", "registers" },
    { "z", "spell_suggest" },
    { "c", "git_bcommits" },
    { "j", "git_status" },
    { "a", "live_grep" },
    { "g", "lsp_definitions" },
    { "e", "diagnostics" },
})
vim.api.nvim_set_keymap(
    "n",
    "<leader>p",
    ":lua require'telescope'.extensions.project.project{}<CR>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>s",
    ":lua require'telescope'.extensions.emoji.emoji{}<CR>",
    { noremap = true, silent = true }
)

