-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.term = "xterm-256color"

-- Default shell
config.default_prog = { "/opt/homebrew/bin/nu" }

-- Font
config.font_size = 14
config.font = wezterm.font({
	family = "RecMonoCasual Nerd Font Mono",
	weight = "Bold",
})
config.font_rules = {
	{
		italic = true,
		font = wezterm.font({
			family = "Maple Mono",
			italic = true,
			weight = "Bold",
		}), -- Custom font for italic text
	},
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 10

-- tokyonight_moon
config.colors = {
	foreground = "#c8d3f5",
	background = "#24283b",
	cursor_bg = "#c8d3f5",
	cursor_border = "#c8d3f5",
	cursor_fg = "#222436",
	selection_bg = "#2d3f76",
	selection_fg = "#c8d3f5",
	split = "#82aaff",
	compose_cursor = "#ff966c",
	scrollbar_thumb = "#2f334d",

	ansi = {
		"#1b1d2b",
		"#ff757f",
		"#c3e88d",
		"#ffc777",
		"#82aaff",
		"#c099ff",
		"#86e1fc",
		"#828bb8",
	},
	brights = {
		"#444a73",
		"#ff8d94",
		"#c7fb6d",
		"#ffd8ab",
		"#9ab8ff",
		"#caabff",
		"#b2ebff",
		"#c8d3f5",
	},

	tab_bar = {
		inactive_tab_edge = "#1e2030",
		background = "#222436",

		active_tab = {
			fg_color = "#1e2030",
			bg_color = "#82aaff",
		},

		inactive_tab = {
			fg_color = "#545c7e",
			bg_color = "#2f334d",
		},

		inactive_tab_hover = {
			fg_color = "#82aaff",
			bg_color = "#2f334d",
			-- intensity = "Bold"
		},

		new_tab_hover = {
			fg_color = "#82aaff",
			bg_color = "#222436",
			intensity = "Bold",
		},

		new_tab = {
			fg_color = "#82aaff",
			bg_color = "#222436",
		},
	},
}

-- and finally, return the configuration to wezterm
return config
