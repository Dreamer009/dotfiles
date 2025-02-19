return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon.setup()

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    -- View harpoon list
    keymap.set("n", "<leader>hl", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Show harpoon jump list" })

    -- Add and remove from the list
    keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end, { desc = "Add buffer file to harpoon jump list" })
    keymap.set("n", "<leader>hx", function()
      harpoon:list():remove()
    end, { desc = "Remove buffer file to harpoon jump list" })

    -- Quick jumping
    keymap.set("n", "<C-1>", function()
      harpoon:list():select(1)
    end)
    keymap.set("n", "<C-2>", function()
      harpoon:list():select(2)
    end)
    keymap.set("n", "<C-3>", function()
      harpoon:list():select(3)
    end)
    keymap.set("n", "<C-4>", function()
      harpoon:list():select(4)
    end)

    -- TODO: come up with better keybindings
    -- Previous and next buffers
    keymap.set("n", "<leader>hp", function()
      harpoon:list():prev({ ui_nav_wrap = true })
    end, { desc = "Go to previous file on jump list" })
    keymap.set("n", "<leader>hn", function()
      harpoon:list():next({ ui_nav_wrap = true })
    end, { desc = "Go to next file on jump list" })
  end,
}
