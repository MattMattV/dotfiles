local wezterm = require 'wezterm'

return {
	initial_cols = 180,
	initial_rows = 40,
	scrollback_lines = 9999999,
	hide_tab_bar_if_only_one_tab = true,
	color_scheme = 'Breeze (Gogh)',
  	font = wezterm.font_with_fallback {
  		{
			family = 'JetBrains Mono',
			harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }
		},
		'Noto Color Emoji'
    }
}
