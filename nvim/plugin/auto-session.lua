vim.pack.add({ "https://github.com/rmagatti/auto-session" })

require("auto-session").setup({})

local keymap = vim.keymap
keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })
