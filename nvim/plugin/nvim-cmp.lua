-- nvim-cmp + snippets + autopairs — lazy loaded on InsertEnter
vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    vim.pack.add({
      -- nvim-cmp must come first so its `cmp` module exists when source
      -- plugins' after/plugin/ scripts auto-register themselves
      "https://github.com/hrsh7th/nvim-cmp",
      { src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("2.x") },
      "https://github.com/hrsh7th/cmp-buffer",
      "https://github.com/hrsh7th/cmp-path",
      "https://github.com/onsails/lspkind.nvim",
      "https://github.com/rafamadriz/friendly-snippets",
      "https://github.com/saadparwaiz1/cmp_luasnip",
      "https://github.com/roobert/tailwindcss-colorizer-cmp.nvim",
      "https://github.com/windwp/nvim-autopairs",
    })

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    local cmp = require("cmp")
    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        format = require("lspkind").cmp_format({
          before = require("tailwindcss-colorizer-cmp").formatter,
        }),
      },
    })

    -- autopairs + cmp integration
    local autopairs = require("nvim-autopairs")
    autopairs.setup({
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
        java = false,
      },
    })
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
})
