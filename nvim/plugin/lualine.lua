vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })

local lualine = require("lualine")

-- -----------------------------------------------------------------------------
-- Theme: Tokyo Night Storm
-- Upstream: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/colors/storm.lua
-- -----------------------------------------------------------------------------
local colors = {
  black = "#1d202f",
  red = "#f7768e",
  green = "#9ece6a",
  yellow = "#e0af68",
  blue = "#7aa2f7",
  magenta = "#bb9af7",
  cyan = "#7dcfff",
  fg = "#c0caf5",
  bg = "#24283b",
  bg_dark = "#1f2335",
  inactive_bg = "#2c3043",
}

lualine.setup({
  sections = {
    lualine_b = {
      {
        icon = "",
        "branch",
      },
      {
        "diff",
        diff_color = {
          added = { fg = colors.green },
          modified = { fg = colors.orange },
          removed = { fg = colors.red },
        },
        cond = function()
          return vim.fn.winwidth(0) > 80
        end,
      },
      "diagnostics",
    },
    lualine_x = {
      { "filetype" },
      { "encoding" },
    },
  },
})
