local wezterm = require("wezterm")

local act = wezterm.action

local wsl_domains = wezterm.default_wsl_domains()

-- wezterm.on("gui-startup", function(cmd)
-- 	local _, _, window = wezterm.mux.spawn_window(cmd or {})
-- 	window:gui_window():toggle_fullscreen()
-- end)

for _, domain in ipairs(wsl_domains) do
  domain.default_cwd = "~"
end

return {
  adjust_window_size_when_changing_font_size = false,
  audible_bell = "Disabled",
  -- color_scheme = 'Catppuccin Frappe',
  disable_default_key_bindings = true,
  exit_behavior = "Close",
  font = wezterm.font({
    -- family = "FiraCode Nerd Font Mono",
    family = "JetBrainsMono Nerd Font",
    weight = "Regular",
    stretch = "Normal",
    style = "Normal",
    harfbuzz_features = { "cv29", "cv30", "ss01", "ss03", "ss06", "ss07", "ss09" },
  }),
  font_size = 12,
  force_reverse_video_cursor = true,
  hide_mouse_cursor_when_typing = true,
  hide_tab_bar_if_only_one_tab = true,
  keys = {
    { action = act.ActivateCommandPalette,                            mods = "CTRL|SHIFT",     key = "P" },
    { action = act.CopyTo("Clipboard"),                               mods = "CTRL|SHIFT",     key = "C" },
    { action = act.DecreaseFontSize,                                  mods = "CTRL",           key = "-" },
    { action = act.IncreaseFontSize,                                  mods = "CTRL",           key = "=" },
    { action = act.Nop,                                               mods = "ALT",            key = "Enter" },
    { action = act.PasteFrom("Clipboard"),                            mods = "CTRL|SHIFT",     key = "V" },
    { action = act.ResetFontSize,                                     mods = "CTRL",           key = "0" },
    { action = act.ToggleFullScreen,                                  key = "F11" },
    { action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }), mods = "CTRL|SHIFT|ALT", key = ">" },
    { action = act.SplitVertical({ domain = "CurrentPaneDomain" }),   mods = "CTRL|SHIFT|ALT", key = "?" },
    { action = act.ActivatePaneDirection("Left"),                     mods = "CTRL|SHIFT",     key = "LeftArrow" },
    { action = act.ActivatePaneDirection("Right"),                    mods = "CTRL|SHIFT",     key = "RightArrow" },
    { action = act.ActivatePaneDirection("Up"),                       mods = "CTRL|SHIFT",     key = "UpArrow" },
    { action = act.ActivatePaneDirection("Down"),                     mods = "CTRL|SHIFT",     key = "DownArrow" },
  },
  scrollback_lines = 10000,
  show_update_window = true,
  use_dead_keys = false,
  unicode_version = 15,
  macos_window_background_blur = 100,
  window_close_confirmation = "NeverPrompt",
  window_padding = {
    left = 0,
    right = 0,
    top = "0.6cell",
    bottom = 0,
  },
  wsl_domains = wsl_domains,
}
