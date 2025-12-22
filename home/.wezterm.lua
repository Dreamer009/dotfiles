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
-- config.font = wezterm.font({
--   family = "JetBrainsMono Nerd Font Mono",
--   harfbuzz_features = { "calt=0", "zero", "cv03", "cv18" },
-- })
-- config.font = wezterm.font({
--   family = "0xProto Nerd Font Mono",
-- })
-- config.font = wezterm.font({
--   family = "Lilex Nerd Font Mono",
--   harfbuzz_features = { "zero", "cv08" },
-- })

-- config.font = wezterm.font_with_fallback({
--   {
--     family = "MonoLisa Default",
--     harfbuzz_features = { "zero", "ss09", "ss17", "ss18" },
--     weight = "Medium",
--   },
--   {
--     family = "JetBrainsMono Nerd Font Mono",
--     harfbuzz_features = { "calt=0", "zero", "cv03", "cv18" },
--   },
-- })

-- config.font = wezterm.font({ family = "RecMonoCasual Nerd Font Mono" })
-- config.line_height = 1.1
-- config.font = wezterm.font({
--   family = "CommitMono Nerd Font Mono",
--   harfbuzz_features = { "ss01", "ss02", "ss03", "ss04", "ss05" },
-- })
-- config.font = wezterm.font({ family = "RobotoMono Nerd Font Mono", })
-- config.font_size = 14
-- config.font = wezterm.font({
--   -- family = "CaskaydiaCove Nerd Font Mono",
--   family = "Cascadia Code NF",
--   harfbuzz_features = { "ss02", "ss19", "ss20" },
-- })

config.font = wezterm.font({
  family = "Maple Mono NF",
  harfbuzz_features = { "cv01", "cv02", "cv03", "cv05", "cv38" },
})

-- config.font_rules = {
--   {
--     italic = true,
--     font = wezterm.font({
--       family = "Maple Mono NF",
--       harfbuzz_features = { "cv01", "cv02", "cv03", "cv05", "cv38" },
--       italic = true,
--     }),
--   },
-- }

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- fullscreen
config.initial_cols = 999
config.initial_rows = 999

-- config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 10

local function setup_colors(config, appearance)
  if appearance:find("Dark") then
    config.color_scheme = "tokyonight_night"
    config.colors = {
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
  else
    config.color_scheme = "catppuccin-latte"
    config.colors = {
      tab_bar = {
        background = "#dce0e8",
        inactive_tab_edge = "#ccd0da",
        active_tab = {
          bg_color = "#8839ef",
          fg_color = "#dce0e8",
        },
        inactive_tab = {
          bg_color = "#bcc0cc",
          fg_color = "#4c4f69",
        },
        inactive_tab_hover = {
          bg_color = "#eff1f5",
          fg_color = "#4c4f69",
        },
        new_tab = {
          bg_color = "#acb0be",
          fg_color = "#4c4f69",
        },
        new_tab_hover = {
          bg_color = "#8839ef",
          fg_color = "#dce0e8",
        },
      },
    }
  end
end

setup_colors(config, wezterm.gui.get_appearance())

-- and finally, return the configuration to wezterm
return config
