-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

if os.getenv("XDG_CURRENT_DESKTOP") == "Hyprland" then
  config.enable_wayland = false
else
  config.enable_wayland = true
end

config.window_background_opacity = 0.4
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 10

return config
