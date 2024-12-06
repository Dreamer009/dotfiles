return {
	"nvim-tree/nvim-web-devicons",
	priority = 100,
	config = function()
		-- -----------------------------------------------------------------------------
		-- Theme: Tokyo Night Storm
		-- Upstream: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/colors/storm.lua
		-- -----------------------------------------------------------------------------
		-- Normal colors
		local colors = {
			black = "#1d202f",
			red = "#f7768e",
			green = "#9ece6a",
			yellow = "#e0af68",
			blue = "#7aa2f7",
			magenta = "#bb9af7",
			cyan = "#7dcfff",
		}

		require("nvim-web-devicons").setup({
			override = {
				["brewfile"] = {
					icon = "",
					color = colors.red,
					cterm_color = "52",
					name = "Brewfile",
				},
				["config.ru"] = {
					icon = "",
					color = colors.red,
					cterm_color = "52",
					name = "ConfigRu",
				},
				["erb"] = {
					icon = "",
					color = colors.red,
					cterm_color = "52",
					name = "Erb",
				},
				["gemfile$"] = {
					icon = "",
					color = colors.red,
					cterm_color = "52",
					name = "Gemfile",
				},
				["gemspec"] = {
					icon = "",
					color = colors.red,
					cterm_color = "52",
					name = "Gemspec",
				},
				["rake"] = {
					icon = "",
					color = colors.red,
					cterm_color = "52",
					name = "Rake",
				},
				["rakefile"] = {
					icon = "",
					color = colors.red,
					cterm_color = "52",
					name = "Rakefile",
				},
				["rb"] = {
					icon = "",
					color = colors.red,
					cterm_color = "52",
					name = "Rb",
				},
			},
		})
	end,
}
