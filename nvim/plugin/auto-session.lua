vim.pack.add({ "https://github.com/rmagatti/auto-session" })

require("auto-session").setup({
  -- grug-far.nvim's scratch buffer isn't a real file; if it's saved into a
  -- session, restoring it later throws E37 on the generated `balt` line.
  -- Force-close it (like checkhealth) before the session is written.
  close_filetypes_on_save = { "checkhealth", "grug-far" },
})

local keymap = vim.keymap
keymap.set("n", "<leader>wr", "<cmd>AutoSession restore<CR>", { desc = "Restore session for cwd" })
keymap.set("n", "<leader>ws", "<cmd>AutoSession save<CR>", { desc = "Save session for auto session root dir" })
