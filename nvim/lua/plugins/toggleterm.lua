return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {},

  config = function()
    local term = require("toggleterm")

    term.setup({
      direction = "float",
      open_mapping = [[<C-\>]],
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set({ "n", "v" }, "<leader>tt", ":ToggleTerm<CR>", { desc = "Open terminal" })
  end,
}
