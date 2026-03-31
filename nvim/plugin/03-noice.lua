-- Noice — override UI early; nui.nvim is a required dependency
vim.pack.add({
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/folke/noice.nvim",
})

require("noice").setup({
  views = {
    mini = {
      align = "message-left",
      position = {
        row = 1,
      },
    },
  },
})
