-- mini.nvim modules: ai, bracketed, surround, splitjoin
vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.ai", version = vim.version.range("*") },
  { src = "https://github.com/nvim-mini/mini.bracketed", version = vim.version.range("*") },
  { src = "https://github.com/nvim-mini/mini.surround", version = vim.version.range("*") },
  { src = "https://github.com/nvim-mini/mini.splitjoin", version = vim.version.range("*") },
})

require("mini.ai").setup()
require("mini.bracketed").setup()

require("mini.surround").setup({
  mappings = {
    add = "s",
    delete = "ds",
    find = "fs",
    find_left = "Fs",
    highlight = "sh",
    replace = "cs",
    update_n_lines = "sn",
    suffix_last = "l",
    suffix_next = "n",
  },
  highlight_duration = 3000,
})

require("mini.splitjoin").setup()
