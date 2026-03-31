vim.pack.add({ "https://github.com/mikavilpas/yazi.nvim" })

require("yazi").setup({
  open_for_directories = false,
  keymaps = {
    show_help = "<f1>",
  },
})

local keymap = vim.keymap
keymap.set({ "n", "v" }, "<leader>y", "<cmd>Yazi<cr>", { desc = "Open yazi at the current file" })
keymap.set("n", "<leader>cw", "<cmd>Yazi cwd<cr>", { desc = "Open the file manager in nvim's working directory" })
