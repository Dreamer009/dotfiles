-- cmp-nvim-lsp loaded eagerly here (even though nvim-cmp is lazy) so that
-- LSP capabilities are available when servers attach on BufReadPre
vim.pack.add({
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/antosha417/nvim-lsp-file-operations",
  "https://github.com/folke/neodev.nvim",
  "https://github.com/neovim/nvim-lspconfig",
})

require("neodev").setup({})
require("lsp-file-operations").setup()

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local keymap = vim.keymap

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }

    opts.desc = "Show LSP references"
    keymap.set("n", "gr", function() Snacks.picker.lsp_references(opts) end, opts)

    opts.desc = "Go to declaration"
    keymap.set("n", "gD", function() Snacks.picker.lsp_declarations(opts) end, opts)

    opts.desc = "Show LSP definitions"
    keymap.set("n", "gd", function() Snacks.picker.lsp_definitions(opts) end, opts)

    opts.desc = "Show LSP implementations"
    keymap.set("n", "gi", function() Snacks.picker.lsp_implementations(opts) end, opts)

    opts.desc = "Show LSP type definitions"
    keymap.set("n", "gt", function() Snacks.picker.lsp_type_definitions(opts) end, opts)

    opts.desc = "See available code actions"
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Smart rename"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "Show buffer diagnostics"
    keymap.set("n", "<leader>D", function() Snacks.picker.lsp_definitions(opts) end, opts)

    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

    opts.desc = "Go to next diagnostic"
    keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

    opts.desc = "Show documentation for what is under cursor"
    keymap.set("n", "K", vim.lsp.buf.hover, opts)

    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
  end,
})

local capabilities = cmp_nvim_lsp.default_capabilities()

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
      [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
    },
  },
})

vim.lsp.config("*", {
  capabilities = capabilities,
})

vim.lsp.config("graphql", {
  capabilities = capabilities,
  filetypes = { "gql", "graphql", "javascriptreact", "svelte", "typescriptreact" },
})

vim.lsp.config("emmet_ls", {
  capabilities = capabilities,
  filetypes = { "css", "html", "javascriptreact", "less", "sass", "scss", "svelte", "typescriptreact", "vue" },
})

vim.lsp.config("svelte", {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.js", "*.ts" },
      callback = function(ctx)
        client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
      end,
    })
  end,
})

vim.lsp.config("ts_ls", {
  capabilities = capabilities,
})
