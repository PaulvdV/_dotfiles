local tree_ok, tree = pcall(require, "nvim-tree")
if not tree_ok then
  return
end

tree.setup({})
