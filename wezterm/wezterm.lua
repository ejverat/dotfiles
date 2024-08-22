-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "Neon (terminal.sexy)"
config.color_scheme = "Neon"
-- config.color_scheme = "AlienBlood"
-- config.color_scheme = "tlh (terminal.sexy)"

-- disable tab bar
config.hide_tab_bar_if_only_one_tab = true

-- window padding
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- font
config.font = wezterm.font("FiraCode Nerd Font")
config.adjust_window_size_when_changing_font_size = false

-- config.window_background_image = "/home/user/Pictures/d8n69md-18f16fb8-639f-4bf7-9291-c9519281ec93.png"
-- config.window_background_opacity = 0.1

-- and finally, return the configuration to wezterm
return config
