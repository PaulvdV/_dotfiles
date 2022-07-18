local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
  return
end

local command_resolver = require("null-ls.helpers.command_resolver")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- Helper to conditionally register eslint handlers only if eslint is
-- configured. If eslint is not configured for a project, it just fails.
local function has_no_prettier_configured(utils)
  return not (utils.root_has_file(".prettierrc.js") or utils.root_has_file(".prettierrc"))
end

local sources = {
  null_ls.builtins.formatting.stylua,

  -- python
  null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.isort,
  null_ls.builtins.diagnostics.flake8,

  -- sh
  null_ls.builtins.formatting.shfmt.with({
    extra_args = { "-i", "2", "-bn", "-ci", "-sr" },
  }),
  null_ls.builtins.diagnostics.shellcheck,

  -- markdown
  null_ls.builtins.diagnostics.markdownlint,
  null_ls.builtins.formatting.markdownlint,

  -- javascript
  null_ls.builtins.code_actions.eslint_d.with({
    dynamic_command = function(params)
      return command_resolver.from_yarn_pnp(params)
          or command_resolver.from_node_modules(params)
          or vim.fn.executable(params.command) == 1 and params.command
    end,
  }),
  null_ls.builtins.diagnostics.eslint_d.with({
    dynamic_command = function(params)
      return command_resolver.from_yarn_pnp(params)
          or command_resolver.from_node_modules(params)
          or vim.fn.executable(params.command) == 1 and params.command
    end,
  }),
  null_ls.builtins.formatting.eslint_d.with({
    condition = has_no_prettier_configured,
    dynamic_command = function(params)
      return command_resolver.from_yarn_pnp(params)
          or command_resolver.from_node_modules(params)
          or vim.fn.executable(params.command) == 1 and params.command
    end,
  }),
  null_ls.builtins.formatting.prettierd.with({
    -- Only register prettier if eslint_d is not running as a formatter. This
    -- can happen if it's not configured for this project, or if it can't
    -- handle the current filetype.
    condition = function()
      return #null_ls.get_source({ name = "eslint_d", method = null_ls.methods.FORMATTING }) == 0
    end,
    dynamic_command = function(params)
      return command_resolver.from_yarn_pnp(params)
          or command_resolver.from_node_modules(params)
          or vim.fn.executable(params.command) == 1 and params.command
    end,
  }),


  null_ls.builtins.completion.spell,

  -- terraform
  null_ls.builtins.formatting.terraform_fmt,

  null_ls.builtins.diagnostics.rubocop,
}

null_ls.setup({
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end
})
