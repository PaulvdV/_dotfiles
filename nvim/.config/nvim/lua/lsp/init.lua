vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = {
      prefix = "●",
      spacing = 2,
    },
    update_in_insert = true,
    severity_sort = true,
  }
)

-- diagnostc signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

pcall(require, "lsp/lsp_installer")
pcall(require, "lsp/nlspsettings")

pcall(require, "lsp/lua")
pcall(require, "lsp/typescript")
pcall(require, "lsp/jsonls")
