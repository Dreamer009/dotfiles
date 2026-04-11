-- Noice — override UI early; nui.nvim is a required dependency
vim.pack.add({
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/folke/noice.nvim",
})

require("noice").setup({
  routes = {
    {
      filter = {
        event = "msg_show",
        find = "Font can't be updated to",
      },
      opts = { skip = true },
    },
  },
  views = {
    mini = {
      align = "message-left",
      position = {
        row = 1,
      },
    },
  },
})
