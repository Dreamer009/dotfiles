return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "black", -- python formatter
        "erb-lint", -- erb linter
        "eslint_d", -- js linter
        "isort", -- python formatter
        "prettier", -- prettier formatter
        "pylint", -- python linter
        "rubocop", -- ruby linter
        "stylua", -- lua formatter
      },
      auto_update = true, -- Automatically update tools
      run_on_start = true, -- Install missing tools when starting Neovim
    })
  end,
}
