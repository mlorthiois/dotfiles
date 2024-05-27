local wezterm = require("wezterm")

local config = wezterm.config_builder()

----------------------------
--UI
----------------------------
config.initial_rows = 100
config.initial_cols = 120
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

if wezterm.gui.get_appearance() == "Light" then
	config.colors = {
		foreground = "#333333",
		background = "#ffffff",

		cursor_bg = "magenta",
		cursor_fg = "black",
		cursor_border = "magenta",

		selection_fg = "black",
		selection_bg = "#fffacd",

		ansi = {
			"#ffffff", -- background
			"#cc0000", -- red
			"#116432", -- green
			"#b58900", -- yellow
			"#85d1ff", -- blue
			"#750154", -- purple
			"#52529e", -- aqua
			"#777777", -- gray
		},
		brights = {
			"#000000", -- gray
			"#cc0000", -- red
			"#116432", -- green
			"#b58900", -- yellow
			"#0344ae", -- blue
			"#750154", -- purple
			"#52529e", -- aqua
			"#333333", -- gray
		},

		scrollbar_thumb = "#222222",
		split = "#444444",
		tab_bar = {
			background = "#e5e5e5",
			active_tab = { bg_color = "#ffffff", fg_color = "#000000" },
			inactive_tab = { bg_color = "#e5e5e5", fg_color = "#808080" },
			new_tab = { bg_color = "#e5e5e5", fg_color = "#808080" },
		},
	}
	config.window_frame = { active_titlebar_bg = "#e5e5e5" }
	config.set_environment_variables = { TERMINAL_THEME = "light" }
else
	config.colors = {
		foreground = "#d1d1d1",
		background = "#1d1d1c",
		cursor_bg = "magenta",
		cursor_fg = "black",
		cursor_border = "magenta",
		selection_fg = "black",
		selection_bg = "#fffacd",
		scrollbar_thumb = "#222222",
		split = "#444444",
		ansi = {
			"#000000",
			"#ff7b72",
			"#94d1b2",
			"#efcba7",
			"#84b3d1",
			"#ba9cd9",
			"#92e5e8",
			"#dddddd",
		},
		brights = {
			"#888888",
			"#ff7b72",
			"#94d1b2",
			"#efcba7",
			"#84b3d1",
			"#ba9cd9",
			"#92e5e8",
			"#dddddd",
		},
		tab_bar = {
			active_tab = { bg_color = "#1d1d1c", fg_color = "#d1d1d1" },
		},
	}
	config.window_frame = { active_titlebar_bg = "#e5e5e5" }
	config.set_environment_variables = { TERMINAL_THEME = "dark" }
end

config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

----------------------------
--Keymaps
----------------------------
local act = wezterm.action
config.keys = {
	{ key = "h", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },
	{ key = "j", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
	{ key = "Enter", mods = "CTRL|SHIFT", action = act.SplitHorizontal },
	{ key = "Enter", mods = "CTRL|SHIFT|ALT", action = act.SplitVertical },
}

return config
