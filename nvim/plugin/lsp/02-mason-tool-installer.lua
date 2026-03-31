vim.pack.add({ "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" })

require("mason-tool-installer").setup({
  ensure_installed = {
    "black",
    "erb-lint",
    "erb-formatter",
    "eslint_d",
    "isort",
    "pylint",
    "rubocop",
    "stylua",
  },
  auto_update = true,
  run_on_start = true,
})
