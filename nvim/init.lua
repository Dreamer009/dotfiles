require("core")
require("lazy-init")

if vim.g.neovide then
  vim.cmd([[autocmd VimEnter * silent! lcd ~/Documents/dev/aiom]])
  vim.cmd([[autocmd VimEnter * silent! SessionRestore<CR>]])
end

vim.opt.list = true -- Enable list mode to show special characters
vim.opt.listchars = {
  tab = " ", -- Display tabs as "▸ " (customize as needed)
  trail = "", -- Display trailing spaces as "•"
}

-- local function open_nvim_tree(data)
--  -- Ensure nvim-tree doesn't open if a directory is passed
--  if vim.fn.isdirectory(data.file) == 1 then
--    return
--  end
--
--  -- Open nvim-tree and focus the file
--  require("nvim-tree.api").tree.open()
--
--  -- Move cursor to the first open file
--  vim.cmd("wincmd l")
-- end
--
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
