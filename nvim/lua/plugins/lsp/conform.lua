return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        erb = { "rubocop" },
        lua = { "stylua" },
        ruby = { "rubocop" },
      },
      formatters = {
        rubocop = {
          command = "sh",
          args = {
            "-c",
            [[rubocop -a -f quiet --stderr --stdin "$0" 2>/dev/null | tail -n +2]],
            "$FILENAME",
          },
          stdin = true,
        },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
