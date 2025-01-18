return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
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
        "ruby_lsp",
        "sqlls",
        "tailwindcss",
        "ts_ls",
        "yamlls",
      },
    })
  end,
}
