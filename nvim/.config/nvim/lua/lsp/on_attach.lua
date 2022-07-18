local api = vim.api
local diagnostic = vim.diagnostic
local lsp = vim.lsp
local lsp_format_augroup = api.nvim_create_augroup("LspFormatting", {})

local utils_ok, utils = pcall(require, "utils")
if not utils_ok then
  return
end

return function(client, bufnr)
  diagnostic.config {
    underline = true,
    float = {
      scope = "cursor",
      source = "always"
    },
    signs = true,
    update_in_insert = true
  }

  -- utils.bufmap("n", "ga", "lua vim.lsp.buf.code_action()")
  -- utils.bufmap("n", "gd", "lua vim.lsp.buf.definition()")
  -- utils.bufmap("n", "gD", "lua vim.lsp.buf.declaration()")
  -- utils.bufmap("n", "gr", "lua vim.lsp.buf.references()")
  -- utils.bufmap("n", "K", "lua vim.lsp.buf.hover()")
  -- utils.bufmap("n", "gl", "lua vim.lsp.diagnostic.show_line_diagnostics()")

  api.nvim_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- autofmt on save
  if client.supports_method("textDocument/formatting") then
    api.nvim_clear_autocmds({
      group = lsp_format_augroup,
      buffer = bufnr
    })
  end

  api.nvim_create_autocmd("BufWritePre", {
    group = lsp_format_augroup,
    buffer = bufnr,
    callback = function()
      lsp.buf.formatting_sync({
        filter = function(c)
          return c.name == "null-ls"
        end,
      })
    end
  })

end
