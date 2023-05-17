local wezterm = require("wezterm")
local font= require("cfg.font")

return {
  font = wezterm.font(font),
  color_scheme = "Oxocarbon Dark",
  -- color_scheme = "Catppuccin Mocha",
  window_padding = {
    top = 0,
    bottom = 0,
    left = 0,
    right = 0,
  },
  colors = {
    background = "#080808",
    foreground = "#F5F5F5",
  },
  enable_tab_bar = false,
  enable_wayland = true,
  enable_scroll_bar = false,
  window_close_confirmation = "NeverPrompt",
}
