local on_attach = require "lsp/on_attach"
local null_ls_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_ok then
  return
end

local sources = {
  null_ls.builtins.diagnostics.eslint_d,

  null_ls.builtins.formatting.prettierd,
  
  -- lua
  null_ls.builtins.formatting.stylua,
  
    -- python
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.diagnostics.flake8,
}

null_ls.setup({ sources = sources, on_attach = on_attach })