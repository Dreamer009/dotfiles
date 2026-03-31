vim.pack.add({ "https://github.com/mfussenegger/nvim-lint" })

local lint = require("lint")

lint.linters_by_ft = {
  erb = { "erb-lint" },
  javascript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  python = { "pylint" },
  svelte = { "eslint_d" },
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  vue = { "eslint_d" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
  group = lint_augroup,
  pattern = "*.erb",
  callback = function()
    local file = vim.fn.expand("%:p")
    vim.fn.system({ "erb-formatter", "--write", file })
    vim.cmd("edit!")
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = lint_augroup,
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.vue" },
  callback = function()
    local file = vim.fn.expand("%:p")
    local cwd = vim.fn.getcwd()
    vim.fn.system({ "pnpm", "eslint", "--fix", file }, cwd)
    vim.cmd("edit!")
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})

vim.keymap.set("n", "<leader>l", function()
  lint.try_lint()
end, { desc = "Trigger linting for current file" })
