local function winnr()
    return vim.api.nvim_win_get_number(0)
end
mode_symbols = {
    ["n"] = "",
    ["no"] = "*",
    ["nov"] = "*",
    ["noV"] = "*",
    ["no"] = "*",
    ["niI"] = "*",
    ["niR"] = "*",
    ["niV"] = "*",
    ["v"] = "",
    ["V"] = "- ",
    [""] = " ",
    ["s"] = "",
    ["S"] = " -",
    [""] = " ",
    ["i"] = "",
    ["ic"] = "",
    ["ix"] = "",
    ["R"] = "屢",
    ["Rc"] = "屢",
    ["Rv"] = "屢",
    ["Rx"] = "屢",
    ["c"] = "",
    ["cv"] = "",
    ["ce"] = "",
    ["r"] = "屢",
    ["rm"] = "ﱟ",
    ["r?"] = "",
    ["!"] = "",
    ["t"] = "",
    ["nt"] = "",
}

local function vim_mode()
    local mode_code = vim.api.nvim_get_mode().mode
    if mode_symbols[mode_code] == nil then
        return mode_code
    end
    return mode_symbols[mode_code]
end

local function lsp_name()
    local msg = ""
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return msg
    end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
        end
    end
    return msg
end
seperators = {
    none = { left = "", right = "" },
    arrow = { left = "", right = "" },
    bubble = { left = "", right = "" },
    slant = { left = "", right = "" },
}

require("lualine").setup({
    options = {
        theme = "dracula",
        icons_enabled = 0,
        section_separators = seperators["arrow"],
        component_separators = "",
        symbols = { modified = " ", readonly = " " },
    },
    sections = {
        lualine_a = { vim_mode },
        lualine_b = {
            { "branch", icon = "" },
        },
        lualine_c = {
            {
                "filetype",
                icon_only = true,
                colored = true,
            },
            { "filename", path = 1 },

            {
                "diff",
                colored = true,
                symbols = {added = " ", modified = "柳", removed = " "}
            }
        },
        lualine_x = {
            {
                "diagnostics",
                sections = { "error", "warn" },
                diagnostics_color = {
                    error = { fg = "#ff5555" },
                    warn = { fg = "#ffb86c" },
                },
                symbols = { error = " ", warn = "  " },
            },
            {
                lsp_name,
                icon = "",
            },
        },
        lualine_y = {},
        lualine_z = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
})

