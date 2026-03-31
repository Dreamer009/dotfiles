-- Run TSUpdate whenever nvim-treesitter is installed or updated
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
      if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/OXY2DEV/markview.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

-- New nvim-treesitter API (rewrite): setup only accepts install_dir
require("nvim-treesitter").setup({})

-- Install parsers (async; runs in background after startup)
vim.schedule(function()
  local ts = require("nvim-treesitter")
  local installed = ts.get_installed()
  local ensure = {
    "bash", "c", "css", "csv", "diff", "dockerfile",
    "elixir", "erlang", "git_config", "git_rebase",
    "gitattributes", "gitcommit", "gitignore", "glsl",
    "graphql", "html", "javascript", "json", "lua", "make",
    "markdown", "markdown_inline", "nu", "query", "regex",
    "ruby", "sql", "typescript", "vim", "vimdoc", "vue", "yaml",
  }
  local to_install = {}
  local installed_set = {}
  for _, p in ipairs(installed) do installed_set[p] = true end
  for _, p in ipairs(ensure) do
    if not installed_set[p] then
      table.insert(to_install, p)
    end
  end
  if #to_install > 0 then
    ts.install(to_install)
  end
end)

-- autotag setup (nvim-ts-autotag handles its own registration)
require("nvim-ts-autotag").setup()

-- Incremental selection via Neovim's built-in treesitter
vim.keymap.set("n", "<C-space>", function()
  vim.cmd("normal! v")
  require("vim.treesitter").node_select()
end, { desc = "Start treesitter selection" })
vim.keymap.set("x", "<C-space>", function()
  require("vim.treesitter").node_select()
end, { desc = "Expand treesitter selection" })
vim.keymap.set("x", "<bs>", function()
  require("vim.treesitter").node_deselect()
end, { desc = "Shrink treesitter selection" })
