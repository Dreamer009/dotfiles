return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		-- -----------------------------------------------------------------------------
		-- Theme: Tokyo Night Storm
		-- Upstream: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/colors/storm.lua
		-- -----------------------------------------------------------------------------
		local colors = {
			black = "#1d202f",
			red = "#f7768e",
			green = "#9ece6a",
			yellow = "#e0af68",
			blue = "#7aa2f7",
			magenta = "#bb9af7",
			cyan = "#7dcfff",
			fg = "#c0caf5",
			bg = "#24283b",
			bg_dark = "#1f2335",
			inactive_bg = "#2c3043",
		}

		-- TODO: Configure this correctly
		--
		-- local my_lualine_theme = {
		-- 	normal = {
		-- 		a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
		-- 		b = { bg = colors.bg, fg = colors.fg },
		-- 		c = { bg = colors.bg, fg = colors.fg },
		-- 	},
		-- 	insert = {
		-- 		a = { bg = colors.green, fg = colors.bg_dark, gui = "bold" },
		-- 		b = { bg = colors.bg, fg = colors.fg },
		-- 		c = { bg = colors.bg, fg = colors.fg },
		-- 	},
		-- 	visual = {
		-- 		a = { bg = colors.violet, fg = colors.bg_dark, gui = "bold" },
		-- 		b = { bg = colors.bg, fg = colors.fg },
		-- 		c = { bg = colors.bg, fg = colors.fg },
		-- 	},
		-- 	command = {
		-- 		a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
		-- 		b = { bg = colors.bg, fg = colors.fg },
		-- 		c = { bg = colors.bg, fg = colors.fg },
		-- 	},
		-- 	replace = {
		-- 		a = { bg = colors.red, fg = colors.bg, gui = "bold" },
		-- 		b = { bg = colors.bg, fg = colors.fg },
		-- 		c = { bg = colors.bg, fg = colors.fg },
		-- 	},
		-- 	inactive = {
		-- 		a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
		-- 		b = { bg = colors.inactive_bg, fg = colors.semilightgray },
		-- 		c = { bg = colors.inactive_bg, fg = colors.semilightgray },
		-- 	},
		-- }

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "tokyonight-storm",
			},
			sections = {
				-- override git icon in section b
				lualine_b = {
					{
						icon = "",
						"branch",
					},
					{
						"diff",
						-- Is it me or the symbol for modified us really weird
						-- symbols = { added = " ", modified = "󰝤 ", removed = " " },
						diff_color = {
							added = { fg = colors.green },
							modified = { fg = colors.orange },
							removed = { fg = colors.red },
						},
						cond = function()
							return vim.fn.winwidth(0) > 80
						end,
					},
					"diagnostics",
				},
				-- add Lazy status indicator
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "filetype" },
				},
			},
		})
	end,
}
