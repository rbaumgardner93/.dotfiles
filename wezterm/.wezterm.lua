local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.colors = {}
config.colors.background = "#111111"

config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	"FiraCode",
})

config.enable_tab_bar = false
config.enable_scroll_bar = false
config.window_padding = {
	top = 0,
	right = 0,
	bottom = 0,
	left = 0,
}

return config
