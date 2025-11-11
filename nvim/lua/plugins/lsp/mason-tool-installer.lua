return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "black", -- python formatter
        "erb-lint", -- erb linter
        "erb-formatter", -- erb formatter
        "eslint_d", -- js linter
        "isort", -- python formatter
        "pylint", -- python linter
        "rubocop", -- ruby linter and formatter
        "stylua", -- lua formatter
        "vue-language-server", -- Vue language server
      },
      auto_update = true, -- Automatically update tools
      run_on_start = true, -- Install missing tools when starting Neovim
    })
  end,
}
