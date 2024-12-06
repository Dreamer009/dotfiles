-- return {
-- 	{
-- 		"navarasu/onedark.nvim",
-- 		priority = 1000, -- make sure to load this before all the other start plugins
-- 		config = function()
-- 			require("onedark").setup({
-- 				style = "dark",
-- 			})
--
-- 			-- load the colorscheme here
-- 			vim.cmd([[colorscheme onedark]])
-- 		end,
-- 	},
-- }

-- return {
-- 	{
-- 		"JoosepAlviste/palenightfall.nvim",
-- 		priority = 1000, -- make sure to load this before all the other start plugins
-- 		config = function()
-- 			require("palenightfall").setup({
-- 				style = "dark",
-- 			})
--
-- 			-- load the colorscheme here
-- 			vim.cmd([[colorscheme palenightfall]])
-- 		end,
-- 	},
-- }

return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "storm",
			})

			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
