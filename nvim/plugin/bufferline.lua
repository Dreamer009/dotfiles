vim.pack.add({ { src = "https://github.com/akinsho/bufferline.nvim", version = vim.version.range("*") } })

require("bufferline").setup({
  options = {
    mode = "tabs",
    separator_style = "slant",
  },
})

if vim.g.neovide then
  vim.opt.showtabline = 2
else
  vim.opt.showtabline = 1
end
