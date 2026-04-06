-- Snacks — load early (was priority=1000/lazy=false in lazy.nvim)
vim.pack.add({ "https://github.com/folke/snacks.nvim" })

local snacks = require("snacks")
snacks.setup({
  bigfile = { enabled = true },
  dashboard = {
    enabled = true,
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
      { section = "startup" },
    },
  },
  explorer = { enabled = true },
  lazygit = {
    enabled = true,
    config = {
      os = {
        edit = '[ -z "$NVIM" ] && (nvim -- {{filename}}) || (nvim --server "$NVIM" --remote-send "q" && nvim --server "$NVIM" --remote {{filename}})',
        editAtLine = '[ -z "$NVIM" ] && (nvim +{{line}} -- {{filename}}) || (nvim --server "$NVIM" --remote-send "q" &&  nvim --server "$NVIM" --remote {{filename}} && nvim --server "$NVIM" --remote-send ":{{line}}<CR>")',
        editAtLineAndWait = "nvim +{{line}} {{filename}}",
        openDirInEditor = '[ -z "$NVIM" ] && (nvim -- {{dir}}) || (nvim --server "$NVIM" --remote-send "q" && nvim --server "$NVIM" --remote {{dir}})',
      },
    },
  },
  input = { enabled = true },
  notifier = { enabled = true },
  picker = {
    enabled = true,
    layout = {
      cycle = false,
    },
    matcher = {
      frecency = true,
    },
    win = {
      input = {
        keys = {
          ["<Esc>"] = { "close", mode = { "n", "i" } },
          ["J"] = { "preview_scroll_down", mode = { "i", "n" } },
          ["K"] = { "preview_scroll_up", mode = { "i", "n" } },
          ["H"] = { "preview_scroll_left", mode = { "i", "n" } },
          ["L"] = { "preview_scroll_right", mode = { "i", "n" } },
        },
      },
    },
  },
  quickfile = { enabled = true },
  terminal = { enabled = true },
  win = {
    keys = {
      q = "close",
    },
  },
})

-- Keymaps
local keymap = vim.keymap

-- Snacks.lazygit
keymap.set("n", "<leader>gb", function() Snacks.git.blame_line() end, { desc = "Git blame line" })
keymap.set("n", "<leader>gl", function() Snacks.lazygit.log_file() end, { desc = "LazyGit Log File" })
keymap.set("n", "<leader>lg", function() Snacks.lazygit() end, { desc = "LazyGit" })

-- Snacks.explorer
keymap.set("n", "<leader>e", function() Snacks.explorer.open({ hidden = true }) end, { desc = "Open Snacks.explorer" })
keymap.set("n", "<C-k><C-b>", function() Snacks.explorer.open({ hidden = true }) end, { desc = "Open Snacks.explorer" })

-- Snacks.notifier
keymap.set("n", "<leader>fh", function() Snacks.notifier.show_history() end, { desc = "Find history" })

-- Snacks.picker
keymap.set("n", "<leader>ff", function() Snacks.picker.files({ hidden = true }) end, { desc = "Find files" })
keymap.set("n", "<leader>fk", function() Snacks.picker.keymaps() end, { desc = "Find keymaps" })
keymap.set("n", "<leader>fr", function() Snacks.picker.recent({ hidden = true }) end, { desc = "Find recent" })
keymap.set("n", "<leader>fs", function() Snacks.picker.grep({ hidden = true }) end, { desc = "Find string" })
keymap.set("n", "<leader>ft", function() Snacks.picker.todo_comments({ hidden = true }) end, { desc = "Find todo" })

-- Snacks.terminal
keymap.set("n", "<leader>tt", function() Snacks.terminal.toggle() end, { desc = "Toggle terminal" })
keymap.set("n", "<C-CR>", function() Snacks.terminal.toggle() end, { desc = "Toggle terminal" })

-- Terminal buffer keymaps
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    local opts = { noremap = true, silent = true, buffer = 0 }
    vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
    vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
    vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
    vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
    vim.keymap.set("t", "<C-CR>", function()
      Snacks.terminal.toggle()
    end, opts)
    vim.keymap.set({ "i", "n", "t" }, "<C-q>", function()
      vim.cmd("close")
    end, opts)
  end,
})
