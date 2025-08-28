return {
  "nvim-mini/mini.surround",
  version = "*",
  config = function()
    require("mini.surround").setup({
      mappings = {
        add = "s", -- Add surrounding in Normal and Visual modes
        delete = "ds", -- Delete surrounding
        find = "fs", -- Find surrounding (to the right)
        find_left = "Fs", -- Find surrounding (to the left)
        highlight = "sh", -- Highlight surrounding
        replace = "cs", -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`

        suffix_last = "l", -- Suffix to search with "prev" method
        suffix_next = "n", -- Suffix to search with "next" method
      },

      -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
      highlight_duration = 3000,
    })
  end,
}
