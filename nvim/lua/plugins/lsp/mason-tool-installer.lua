return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "black", -- python formatter
        "eslint_d", -- js linter
        "isort", -- python formatter
        "prettier", -- prettier formatter
        "pylint", -- python linter
        "rubocop", -- ruby linter
        "stylua", -- lua formatter
      },
    })
  end,
}
