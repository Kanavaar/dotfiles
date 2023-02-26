local wezterm = require("wezterm")
local font= require("cfg.font")

return {
  font = wezterm.font(font),
  color_scheme = "Gruvbox Light",
  window_padding = {
    top = 0,
    bottom = 0,
    left = 0,
    right = 0,
  },
  enable_tab_bar = false,
  enable_wayland = true,
  enable_scroll_bar = false,
}
