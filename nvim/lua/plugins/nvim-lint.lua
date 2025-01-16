return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
      ruby = { "rubocop" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    -- Run RuboCop autocorrect on save for Ruby files
    vim.api.nvim_create_autocmd("BufWritePost", {
      group = lint_augroup,
      pattern = "*.rb",
      callback = function()
        local file = vim.fn.expand("%:p") -- Get the full file path
        -- Run RuboCop autocorrect
        vim.fn.system({ "rubocop", "--autocorrect", file })
      end,
    })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
