return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  keys = {
    {
      "<leader>gb",
      function()
        Snacks.git.blame_line()
      end,
      desc = "LazyGit",
    },

    -- Snacks.lazygit
    {
      "<leader>lg",
      function()
        Snacks.lazygit()
      end,
      desc = "LazyGit",
    },
    {
      "<leader>gl",
      function()
        Snacks.lazygit.log_file()
      end,
      desc = "LazyGit Log File",
    },

    -- Snacks.notifier
    {
      "<leader>fh",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Find history",
    },

    -- Snacks.picker
    {
      "<leader>ff",
      function()
        Snacks.picker.files({ hidden = true })
      end,
      desc = "Find files",
    },
    {
      "<leader>fk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Find keymaps",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent({ hidden = true })
      end,
      desc = "Find recent",
    },
    {
      "<leader>fs",
      function()
        Snacks.picker.grep({ hidden = true })
      end,
      desc = "Find string",
    },
    {
      "<leader>ft",
      function()
        Snacks.picker.todo_comments({ hidden = true })
      end,
      desc = "Find todo",
    },
  },
  opts = {
    integrations = {
      lazygit = {
        open_in_current_buffer = true, -- Ensures LazyGit opens files in the same buffer
      },
    },
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,

      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
    lazygit = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    picker = {
      enabled = true,
      -- debug = {
      --   scores = true, -- show scores in the list
      -- },
      layout = {
        -- When reaching the bottom of the results in the picker, I don't want
        -- it to cycle and go back to the top
        cycle = false,
      },
      matcher = {
        frecency = true,
      },
      win = {
        input = {
          keys = {
            -- to close the picker on ESC instead of going to normal mode,
            -- add the following keymap to your config
            ["<Esc>"] = { "close", mode = { "n", "i" } },
            -- I'm used to scrolling like this in LazyGit
            ["J"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["K"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["H"] = { "preview_scroll_left", mode = { "i", "n" } },
            ["L"] = { "preview_scroll_right", mode = { "i", "n" } },
          },
        },
      },
    },
    quickfile = { enabled = true },
    win = {
      keys = {
        q = "close",
        ["<Esc>"] = "close",
      },
    },
  },
}
