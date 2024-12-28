-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.term = "xterm-256color"

-- Default shell
config.default_prog = { "/opt/homebrew/bin/nu" }

-- Make it go fast
config.max_fps = 120
config.prefer_egl = true

-- Increase scrollback_lines
config.scrollback_lines = 10000

-- Font
config.font_size = 13
config.font = wezterm.font({
  family = "RecMonoCasual Nerd Font Mono",
  harfbuzz_features = { "calt=0" },
  -- weight = "Bold",
})
config.font_rules = {
  {
    italic = true,
    font = wezterm.font({
      family = "Maple Mono NF",
      italic = true,
      -- weight = "Bold",
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

-- -----------------------------------------------------------------------------
-- TokyoNight WezTerm Colors
-- Theme: Tokyo Night Night
-- Upstream: https://github.com/folke/tokyonight.nvim/raw/main/extras/alacritty/tokyonight_storm.toml
-- -----------------------------------------------------------------------------

config.colors = {
  foreground = "#c0caf5",
  background = "#1a1b26",
  cursor_bg = "#c0caf5",
  cursor_border = "#c0caf5",
  cursor_fg = "#1a1b26",
  selection_bg = "#283457",
  selection_fg = "#c0caf5",
  split = "#7aa2f7",
  compose_cursor = "#ff9e64",
  scrollbar_thumb = "#292e42",
  ansi = { "#15161e", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6" },
  brights = { "#414868", "#ff899d", "#9fe044", "#faba4a", "#8db0ff", "#c7a9ff", "#a4daff", "#c0caf5" },
  tab_bar = {
    inactive_tab_edge = "#16161e",
    background = "#1a1b26",
    active_tab = {
      fg_color = "#16161e",
      bg_color = "#7aa2f7",
    },
    inactive_tab = {
      fg_color = "#545c7e",
      bg_color = "#292e42",
    },
    inactive_tab_hover = {
      fg_color = "#7aa2f7",
      bg_color = "#292e42",
    },
    new_tab_hover = {
      fg_color = "#7aa2f7",
      bg_color = "#1a1b26",
      intensity = "Bold",
    },
    new_tab = {
      fg_color = "#7aa2f7",
      bg_color = "#1a1b26",
    },
  },
}

-- and finally, return the configuration to wezterm
return config
