-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- alias 'W' and 'w'
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("Wqa", "wqa", {})

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- disable a few default NeoVim commands
keymap.set("i", "<C-d>", "<Nop>", { noremap = true, silent = true })
keymap.set("i", "<C-t>", "<Nop>", { noremap = true, silent = true })

-- copy and paste
keymap.set("n", "<D-c>", '"+p', { noremap = true, silent = true })
keymap.set("i", "<D-c>", '<C-o>"+p', { noremap = true, silent = true })
keymap.set("n", "<D-v>", '"+p', { noremap = true, silent = true })
keymap.set("i", "<D-v>", '<C-o>"+p', { noremap = true, silent = true })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Keep window centered when going up/down
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "G", "Gzz")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Copy file paths
keymap.set("n", "<leader>cf", '<cmd>let @+ = expand("%")<CR>', { desc = "Copy File Name" })
keymap.set("n", "<leader>cp", '<cmd>let @+ = expand("%:p")<CR>', { desc = "Copy File Path" })

-- Exit quickly (and remember state)
keymap.set("n", "<leader>q", ":wqa<CR>", { desc = "Save and quit" }) -- split window vertically

-- Get file relative path
keymap.set("n", "<leader>rp", [[:let @+ = expand('%')<CR>]], {
  desc = "Get reative file path",
  noremap = true,
  silent = true,
})

-- disable highlighted search by hitting escape
keymap.set("n", "<Esc>", function()
  if vim.v.hlsearch == 1 then
    vim.cmd("noh")
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
  end
end, { silent = true })

-- Neovide
if vim.g.neovide then
  vim.cmd([[autocmd VimEnter * silent! lcd ~/Documents/dev/aiom]])
  vim.cmd([[autocmd VimEnter * silent! SessionRestore<CR>]])
end
