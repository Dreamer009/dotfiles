vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

local conform = require("conform")
local util = require("conform.util")

-- Use `bundle exec rubocop` when inside a bundled project, otherwise fall back
-- to the global (mason) rubocop.
local function rubocop_command(self, ctx)
  local gemfile = vim.fs.find("Gemfile", { path = ctx.filename, upward = true })[1]
  if gemfile then
    return "bundle"
  end
  return "rubocop"
end

local function rubocop_args(self, ctx)
  local gemfile = vim.fs.find("Gemfile", { path = ctx.filename, upward = true })[1]
  local base = { "-a", "-f", "quiet", "--stderr", "--stdin", ctx.filename }
  if gemfile then
    return vim.list_extend({ "exec", "rubocop" }, base)
  end
  return vim.list_extend({ "--server" }, base)
end

conform.setup({
  formatters_by_ft = {
    erb = { "rubocop" },
    lua = { "stylua" },
    ruby = { "rubocop" },
  },
  formatters = {
    rubocop = {
      command = rubocop_command,
      args = rubocop_args,
      cwd = util.root_file({ "Gemfile" }),
      exit_codes = { 0, 1 },
      stdin = true,
    },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 5000,
  },
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 5000,
  })
end, { desc = "Format file or range (in visual mode)" })


