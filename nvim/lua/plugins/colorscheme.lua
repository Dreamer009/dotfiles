return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
			})

			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
