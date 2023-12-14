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
    font = wezterm.font_with_fallback({ "JetBrainsMono NF" }),
    -- font = wezterm.font("ComicCodeLigatures NF", { weight = "Medium" }),
    font_size = 11,
    force_reverse_video_cursor = true,
    hide_mouse_cursor_when_typing = true,
    hide_tab_bar_if_only_one_tab = true,
    keys = {
        { action = act.SplitHorizontal({ domain             = "CurrentPaneDomain" }), mods = "CTRL|SHIFT|ALT", key = ">" },
        { action = act.SplitVertical({ domain               = "CurrentPaneDomain" }), mods = "CTRL|SHIFT|ALT", key = "?" },
        { action = act.ResetFontSize, mods                  = "CTRL", key                  = "0" },
        { action = act.DecreaseFontSize, mods               = "CTRL", key                  = "-" },
        { action = act.IncreaseFontSize, mods               = "CTRL", key                  = "=" },
        { action = act.Nop, mods                            = "ALT", key                   = "Enter" },
        { action = act.ToggleFullScreen, key                = "F11" },
        { action = act.ActivateCommandPalette, mods         = "CTRL|SHIFT", key            = "P" },
        { action = act.CopyTo("Clipboard"), mods            = "CTRL|SHIFT", key            = "C" },
        { action = act.PasteFrom("Clipboard"), mods         = "CTRL|SHIFT", key            = "V" },
        { action = act.ActivatePaneDirection("Left"), mods  = "CTRL|SHIFT", key            = "LeftArrow" },
        { action = act.ActivatePaneDirection("Right"), mods = "CTRL|SHIFT", key            = "RightArrow" },
        { action = act.ActivatePaneDirection("Up"), mods    = "CTRL|SHIFT", key            = "UpArrow" },
        { action = act.ActivatePaneDirection("Down"), mods  = "CTRL|SHIFT", key            = "DownArrow" },
        { action = act.SpawnTab 'CurrentPaneDomain', mods   = 'CTRL|SHIFT', key            = 't' },
    },
    mouse_bindings = {
        {
            event = { Up = { streak = 1, button = 'Left' } },
            mods = 'NONE',
            action = wezterm.action.CompleteSelection 'Clipboard',
        },
        -- Ctrl-click will open the link under the mouse cursor
        {
          event = { Up = { streak = 1, button = 'Left' } },
          mods = 'CTRL',
          action = wezterm.action.OpenLinkAtMouseCursor,
        },
    },
    scrollback_lines = 10000,
    show_update_window = true,
    use_dead_keys = false,
    unicode_version = 15,
    macos_window_background_blur = 100,
    window_background_opacity = 0.85,
    window_close_confirmation = "NeverPrompt",
    window_padding = {
        left = 0,
        right = 0,
        top = "0.6cell",
        bottom = 0,
    },
    wsl_domains = wsl_domains,
}
