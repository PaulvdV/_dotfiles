local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      local lua_snip_ok, lua_snip = pcall(require, 'luasnip')
      if not lua_snip_ok then
        return
      end
      lua_snip.lsp_expand(args)
    end,
  },
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    { name = "luasnip" },
  },
})
