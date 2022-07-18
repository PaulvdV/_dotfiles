local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
  return
end

local autopairs_ok, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_ok then
  return
end

local cmp_autopairs_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_ok then
  return
end

autopairs.setup({
  enable_check_bracket_line = false,
  ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
})

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

