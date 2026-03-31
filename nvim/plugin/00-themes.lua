-- Colorschemes — load first so they're available for auto-dark-mode
vim.pack.add({
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  "https://github.com/folke/tokyonight.nvim",
})

require("catppuccin").setup({
  flavour = "latte",
})

require("tokyonight").setup({
  style = "night",
})
