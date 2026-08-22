local mod = "SUPER"
local modShift = "SUPER + SHIFT"

-- 1. Applications
hl.bind(mod .. " + Return", hl.dsp.exec_cmd(terminal), { description = "Open terminal" })
hl.bind(mod .. " + E", hl.dsp.exec_cmd(fileManager), { description = "Open file manager" })
hl.bind(mod .. " + space", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"), { description = "Open app launcher" })
hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd("kitty -e btop"), { description = "Open app launcher" })
hl.bind(mod .. " + Y", hl.dsp.exec_cmd([[kitty zsh -ic "rice; exec zsh"]]), { description = "Open app launcher" })

-- 2. Windows
hl.bind(mod .. " + C", hl.dsp.window.close(), { description = "Close window" })
hl.bind(mod .. " + F", hl.dsp.window.fullscreen(), { description = "Toggle fullscreen" })
hl.bind(modShift .. " + R", hl.dsp.exec_cmd("hyprctl reload"), { description = "Reload compositor" })

-- 3. Focus
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left"  }), { description = "Focus left" })
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down"  }), { description = "Focus down" })
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up"    }), { description = "Focus up" })
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }), { description = "Focus right" })
hl.bind(mod .. " + left",  hl.dsp.focus({ direction = "left"  }), { description = "Focus left" })
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }), { description = "Focus right" })
hl.bind(mod .. " + up",    hl.dsp.focus({ direction = "up"    }), { description = "Focus up" })
hl.bind(mod .. " + down",  hl.dsp.focus({ direction = "down"  }), { description = "Focus down" })

-- 4. Move Windows
hl.bind(modShift .. " + H", hl.dsp.window.move({ direction = "left"  }), { description = "Move window left" })
hl.bind(modShift .. " + J", hl.dsp.window.move({ direction = "down"  }), { description = "Move window down" })
hl.bind(modShift .. " + K", hl.dsp.window.move({ direction = "up"    }), { description = "Move window up" })
hl.bind(modShift .. " + L", hl.dsp.window.move({ direction = "right" }), { description = "Move window right" })
hl.bind(modShift .. " + left",  hl.dsp.window.move({ direction = "left"  }), { description = "Move window left" })
hl.bind(modShift .. " + down",  hl.dsp.window.move({ direction = "down"  }), { description = "Move window down" })
hl.bind(modShift .. " + up",    hl.dsp.window.move({ direction = "up"    }), { description = "Move window up" })
hl.bind(modShift .. " + right", hl.dsp.window.move({ direction = "right" }), { description = "Move window right" })

-- 5. Workspaces
for i = 1, 9 do
    hl.bind(mod .. " + " .. i, hl.dsp.focus({ workspace = i }), { description = "Workspace " .. i })
    hl.bind(modShift .. " + " .. i, hl.dsp.window.move({ workspace = i }), { description = "Move to workspace " .. i })
end
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Next workspace" })
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }), { description = "Previous workspace" })

-- 6. Mouse
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true, description = "Drag to move window" })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Drag to resize window" })

-- 7. Noctalia Shell
hl.bind(mod .. " + V",       hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"),                           { description = "Toggle clipboard" })
hl.bind(mod .. " + Escape",  hl.dsp.exec_cmd("noctalia msg panel-toggle control-center"),                      { description = "Toggle control center" })
hl.bind(mod .. " + Period",  hl.dsp.exec_cmd("noctalia msg settings-toggle"),                                  { description = "Toggle settings" })
hl.bind(modShift .. " + C",  hl.dsp.exec_cmd("noctalia msg panel-toggle oldirtty/color_picker:panel"),         { description = "Toggle color picker" })
hl.bind(modShift .. " + Slash", hl.dsp.exec_cmd("noctalia msg panel-toggle kenn/keybind-cheatsheet:cheatsheet"), { description = "Toggle keybind cheatsheet" })
hl.bind(mod .. " + Backspace",  hl.dsp.exec_cmd("noctalia msg panel-toggle session"),         { description = "Toggle session panel" })

-- 8. Media
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("noctalia msg volume-up"),   { locked = true, repeating = true, description = "Volume up" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("noctalia msg volume-down"), { locked = true, repeating = true, description = "Volume down" })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("noctalia msg volume-mute"), { locked = true,                   description = "Mute / unmute" })
hl.bind("XF86Launch6",          hl.dsp.exec_cmd("noctalia msg mic-mute"),    { locked = true,                   description = "Mute / unmute microphone" })

-- 9. Brightness
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("noctalia msg brightness-up"),   { locked = true, repeating = true, description = "Brightness up" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("noctalia msg brightness-down"), { locked = true, repeating = true, description = "Brightness down" })

-- 10. Screenshots
hl.bind(modShift .. " + S", hl.dsp.exec_cmd("noctalia msg screenshot-region"),     { description = "Region screenshot → clipboard" })
hl.bind("Print",             hl.dsp.exec_cmd("noctalia msg screenshot-fullscreen"), { description = "Fullscreen screenshot → clipboard" })
