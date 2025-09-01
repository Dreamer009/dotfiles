return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  keys = {
    -- Snacks.lazygit
    {
      "<leader>gb",
      function()
        Snacks.git.blame_line()
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
    {
      "<leader>lg",
      function()
        Snacks.lazygit()
      end,
      desc = "LazyGit",
    },

    -- Snacks.explorer
    {
      "<leader>e",
      function()
        Snacks.explorer.open({ hidden = true })
      end,
      desc = "Open Snacks.explorer",
    },
    {
      "<C-k><C-b>",
      function()
        Snacks.explorer.open({ hidden = true })
      end,
      desc = "Open Snacks.explorer",
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

    -- Snacks.terminal
    {
      "<leader>tt",
      function()
        Snacks.terminal.toggle()
      end,
      desc = "Toggle terminal",
    },
    {
      "<C-CR>",
      function()
        Snacks.terminal.toggle()
      end,
      desc = "Toggle terminal",
    },
  },
  config = function()
    local snacks = require("snacks")
    snacks.setup({
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
      explorer = { enabled = true },
      lazygit = {
        enabled = true,
        config = {
          os = {
            edit = '[ -z "$NVIM" ] && (nvim -- {{filename}}) || (nvim --server "$NVIM" --remote-send "q" && nvim --server "$NVIM" --remote {{filename}})',
            editAtLine = '[ -z "$NVIM" ] && (nvim +{{line}} -- {{filename}}) || (nvim --server "$NVIM" --remote-send "q" &&  nvim --server "$NVIM" --remote {{filename}} && nvim --server "$NVIM" --remote-send ":{{line}}<CR>")',
            editAtLineAndWait = "nvim +{{line}} {{filename}}",
            openDirInEditor = '[ -z "$NVIM" ] && (nvim -- {{dir}}) || (nvim --server "$NVIM" --remote-send "q" && nvim --server "$NVIM" --remote {{dir}})',
          },
        },
      },
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
      terminal = {
        enabled = true,
        -- Uncomment for floating style
        -- win = {
        --   style = "float", -- force floating terminal
        --   border = "rounded", -- other options: "single", "double", "solid", "shadow", etc.
        --   width = 0.9, -- 90% of the editor width
        --   height = 0.9, -- 80% of the editor height
        -- },
      },
      win = {
        keys = {
          q = "close",
          ["<Esc>"] = "close",
        },
      },
    })

    -- Only apply in terminal buffers (Snacks terminal is just a terminal buffer)
    vim.api.nvim_create_autocmd("TermOpen", {
      callback = function()
        local opts = { noremap = true, silent = true, buffer = 0 }
        vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
        vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
        vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
        vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
        vim.keymap.set("t", "<C-CR>", function()
          Snacks.terminal.toggle()
        end, opts)
        vim.keymap.set({ "i", "n", "t" }, "<C-q>", function()
          vim.cmd("close") -- closes the floating terminal window
        end, opts)
      end,
    })
  end,
}
