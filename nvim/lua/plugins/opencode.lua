return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for better prompt input, and required to use `opencode.nvim`'s embedded terminal — otherwise optional
    { "folke/snacks.nvim", opts = { input = { enabled = true } } },
  },
  config = function()
    vim.g.opencode_opts = {
      terminal = {
        auto_close = true,
        win = {
          position = "float", -- <<── instead of "right"
          border = "rounded", -- optional: give it a border
          -- Stay in the editor after opening the terminal
          enter = true,
          wo = {
            -- Title is unnecessary - `opencode` TUI has its own footer
            winbar = "",
          },
          bo = {
            -- Make it easier to target for customization, and prevent possibly unintended `"snacks_terminal"` targeting.
            -- e.g. the recommended edgy.nvim integration puts all `"snacks_terminal"` windows at the bottom.
            filetype = "opencode_terminal",
          },
        },
      },
    }

    -- Required for `opts.auto_reload`
    vim.opt.autoread = true

    -- Recommended keymaps
    vim.keymap.set("n", "<leader>ot", function()
      require("opencode").toggle()
    end, { desc = "Toggle opencode" })
    vim.keymap.set("n", "<leader>oA", function()
      require("opencode").ask()
    end, { desc = "Ask opencode" })
    vim.keymap.set("n", "<leader>oa", function()
      require("opencode").ask("@cursor: ")
    end, { desc = "Ask opencode about this" })
    vim.keymap.set("v", "<leader>oa", function()
      require("opencode").ask("@selection: ")
    end, { desc = "Ask opencode about selection" })
    vim.keymap.set("n", "<leader>on", function()
      require("opencode").command("session_new")
    end, { desc = "New opencode session" })
    vim.keymap.set("n", "<leader>oy", function()
      require("opencode").command("messages_copy")
    end, { desc = "Copy last opencode response" })
    vim.keymap.set("n", "<S-C-u>", function()
      require("opencode").command("messages_half_page_up")
    end, { desc = "Messages half page up" })
    vim.keymap.set("n", "<S-C-d>", function()
      require("opencode").command("messages_half_page_down")
    end, { desc = "Messages half page down" })
    vim.keymap.set({ "n", "v" }, "<leader>os", function()
      require("opencode").select()
    end, { desc = "Select opencode prompt" })

    -- Example: keymap for custom prompt
    vim.keymap.set("n", "<leader>oe", function()
      require("opencode").prompt("Explain @cursor and its context")
    end, { desc = "Explain this code" })
  end,
}
