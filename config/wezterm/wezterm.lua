local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return {
	color_scheme = "Catppuccin Mocha",
	default_prog = { "/opt/homebrew/bin/tmux" },
	font_size = 14,
	hide_tab_bar_if_only_one_tab = true,
	send_composed_key_when_left_alt_is_pressed = false,
	window_decorations = "RESIZE",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
}
