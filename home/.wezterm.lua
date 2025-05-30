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
-- config.font = wezterm.font({
--   family = "MonoLisa Default",
--   harfbuzz_features = { "zero", "ss03", "ss07", "ss09", "ss17", "ss18" },
-- })
-- config.font = wezterm.font({ family = "RecMonoCasual Nerd Font Mono" })
-- config.line_height = 1.1
-- config.font = wezterm.font({
--   family = "CommitMono Nerd Font Mono",
--   harfbuzz_features = { "ss01", "ss02", "ss03", "ss04", "ss05" },
-- })
-- config.font = wezterm.font({ family = "RobotoMono Nerd Font Mono", })

config.font = wezterm.font({ family = "Maple Mono NF", harfbuzz_features = { "cv01", "cv05", "cv38" } })

-- config.font_rules = {
--   {
--     italic = true,
--     font = wezterm.font({
--       family = "Maple Mono NF",
--       harfbuzz_features = { "cv01" },
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

-- config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 10

local function scheme_for_appearance(appearance)
  if appearance:find("Dark") then
    -- -----------------------------------------------------------------------------
    -- TokyoNight WezTerm Colors
    -- Theme: Tokyo Night Night
    -- Upstream: https://github.com/folke/tokyonight.nvim/raw/main/extras/alacritty/tokyonight_storm.toml
    -- -----------------------------------------------------------------------------
    return {
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
  else
    -- -----------------------------------------------------------------------------
    -- Catppuccin WezTerm Colors
    -- Theme: Catppuccin Latte
    -- Upstream: https://github.com/catppuccin/wezterm/blob/main/dist/catppuccin-latte.toml
    -- -----------------------------------------------------------------------------
    return {
      foreground = "#4c4f69",
      background = "#eff1f5",
      ansi = { "#bcc0cc", "#d20f39", "#40a02b", "#df8e1d", "#1e66f5", "#ea76cb", "#179299", "#5c5f77" },
      brights = { "#acb0be", "#d20f39", "#40a02b", "#df8e1d", "#1e66f5", "#ea76cb", "#179299", "#6c6f85" },
      compose_cursor = "#dd7878",
      cursor_bg = "#dc8a78",
      cursor_border = "#dc8a78",
      cursor_fg = "#dce0e8",
      scrollbar_thumb = "#acb0be",
      selection_bg = "#acb0be",
      selection_fg = "#4c4f69",
      split = "#9ca0b0",
      visual_bell = "#ccd0da",
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

config.colors = scheme_for_appearance(wezterm.gui.get_appearance())

-- and finally, return the configuration to wezterm
return config
