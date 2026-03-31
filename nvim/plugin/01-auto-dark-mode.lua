-- Auto dark/light mode — depends on themes being set up first (00-themes.lua)
vim.pack.add({ "https://github.com/f-person/auto-dark-mode.nvim" })

local auto_dark_mode = require("auto-dark-mode")
auto_dark_mode.setup({
  update_interval = 1000,
  set_dark_mode = function()
    vim.api.nvim_set_option_value("background", "dark", {})
    vim.cmd("colorscheme tokyonight")
  end,
  set_light_mode = function()
    vim.api.nvim_set_option_value("background", "light", {})
    vim.cmd("colorscheme catppuccin")
  end,
})
auto_dark_mode.init()
