-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is a workaround until the issue is fixed
if os.getenv("XDG_CURRENT_DESKTOP") == "Hyprland" then
  config.enable_wayland = false
else
  config.enable_wayland = true
end

config.front_end = "WebGpu"

config.window_background_opacity = 0.4
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 10.5
-- config.enable_tab_bar = false
-- config.window_decorations = "RESIZE"
config.enable_scroll_bar = true

config.window_padding = {
  left = 2,
  right = 12,
  top = 0,
  bottom = 0,
}



return config
