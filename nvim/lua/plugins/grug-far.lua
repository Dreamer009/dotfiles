return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require("grug-far").setup({})

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>fp", ":GrugFar<CR>", { desc = "Project find and replace" })
  end,
}
