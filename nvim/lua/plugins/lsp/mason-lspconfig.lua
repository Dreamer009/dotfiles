return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "cssls",
        "dockerls",
        "elixirls",
        "emmet_ls",
        "html",
        "lua_ls",
        "pylsp",
        "rubocop",
        "ruby_lsp",
        "sqlls",
        "tailwindcss",
        "ts_ls",
        "yamlls",
      },
    })
  end,
}
