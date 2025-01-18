return {
  "f-person/auto-dark-mode.nvim",
  dependencies = {
    "catppuccin/nvim",
    "folke/tokyonight.nvim",
  },
  config = function()
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

    -- Initialize auto-dark-mode to detect system changes
    auto_dark_mode.init()
  end,
}
