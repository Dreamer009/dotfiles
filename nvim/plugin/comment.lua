-- Comment.nvim with treesitter context-aware commenting
vim.pack.add({
  "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
  "https://github.com/numToStr/Comment.nvim",
})

-- Disable the CursorHold autocmd — Comment.nvim calls it via pre_hook instead
require("ts_context_commentstring").setup({ enable_autocmd = false })

local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

require("Comment").setup({
  padding = true,
  sticky = true,
  ignore = nil,
  toggler = {
    line = "<C-/>",
    block = "gbc",
  },
  opleader = {
    line = "<C-/>",
    block = "gb",
  },
  extra = {
    above = "gcO",
    below = "gco",
    eol = "gcA",
  },
  mappings = {
    basic = true,
    extra = true,
  },
  pre_hook = ts_context_commentstring.create_pre_hook(),
  post_hook = nil,
})
