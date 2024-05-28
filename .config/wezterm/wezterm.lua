local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

--config.color_scheme = 'Monokai Remastered'
config.color_scheme = 'Oxocarbon Dark (Gogh)'
config.use_fancy_tab_bar = true
-- config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = false


config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'

config.default_prog = { '/usr/bin/fish', '-l' }
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font('JetBrainsMono Nerd Font')
-- config.font = wezterm.font('0xproto Nerd Font')

return config

-- return {
-- 	default_prog =
-- 	initial_cols = 180,
-- 	initial_rows = 40,
-- 	scrollback_lines = 9999999,
-- 	hide_tab_bar_if_only_one_tab = true,
-- 	color_scheme = 'Breeze (Gogh)',
--   	font = wezterm.font_with_fallback {
--   		{
-- 			family = 'JetBrains Mono',
-- 			harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }
-- 		},
-- 		'Noto Color Emoji'
--     }
-- }
