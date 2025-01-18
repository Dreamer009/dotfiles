return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "f-person/auto-dark-mode.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  version = "*",
  optiolazy = true, -- Ensures it's only loaded when required
  event = "ColorScheme", -- Load bufferline when the colorscheme changes
  config = function()
    require("bufferline").setup({
      options = {
        mode = "tabs",
        separator_style = "slant",
      },
    })

    -- showtabs by default in neovide
    if vim.g.neovide then
      vim.opt.showtabline = 2
    else
      vim.opt.showtabline = 1
    end
  end,
}
