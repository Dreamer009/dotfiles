vim.pack.add({ "https://github.com/williamboman/mason-lspconfig.nvim" })

require("mason-lspconfig").setup({
  ensure_installed = {
    "cssls",
    "dockerls",
    "elixirls",
    "emmet_ls",
    "eslint",
    "html",
    "lua_ls",
    "pylsp",
    "ruby_lsp",
    "solargraph",
    "sqlls",
    "tailwindcss",
    "ts_ls",
    "yamlls",
  },
})
