local mod = "SUPER"
local modShift = "SUPER + SHIFT"

-- Window management 
hl.bind(mod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + C", hl.dsp.window.close())
hl.bind(mod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + V", hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"))
hl.bind(modShift .. " + F", hl.dsp.window.fullscreen())
hl.bind(modShift .. " + R", hl.dsp.exec_cmd("hyprctl reload"))

-- Focus (hjkl + arrows) 
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left"  }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down"  }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up"    }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + left", hl.dsp.focus({ direction = "left"  }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "up"    }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "down"  }))

-- Move windows (hjkl) 
hl.bind(modShift .. " + H", hl.dsp.window.move({ direction = "left"  }))
hl.bind(modShift .. " + J", hl.dsp.window.move({ direction = "down"  }))
hl.bind(modShift .. " + K", hl.dsp.window.move({ direction = "up"    }))
hl.bind(modShift .. " + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(modShift .. " + left", hl.dsp.window.move({ direction = "left"  }))
hl.bind(modShift .. " + down", hl.dsp.window.move({ direction = "down"  }))
hl.bind(modShift .. " + up", hl.dsp.window.move({ direction = "up"    }))
hl.bind(modShift .. " + right", hl.dsp.window.move({ direction = "right" }))

-- Workspaces 1–9 
for i = 1, 9 do
    hl.bind(mod .. " + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(modShift .. " + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Workspace scroll 
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Mouse: move and resize 
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })  --LMB: drag to move
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })  --RMB: drag to resize

-- Noctalia IPC 
hl.bind(mod .. " + space", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))
hl.bind(mod .. " + Escape",     hl.dsp.exec_cmd("noctalia msg panel-toggle control-center"))
hl.bind(mod .. " + N", hl.dsp.exec_cmd("noctalia msg settings-toggle"))

-- Media keys 
--Audio routed through Noctalia so the overlay widget updates.
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("noctalia msg volume-up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("noctalia msg volume-down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",    hl.dsp.exec_cmd("noctalia msg volume-mute"), { locked = true })
hl.bind("XF86Launch6", hl.dsp.exec_cmd("noctalia msg mic-mute"), { locked = true })

-- Brightness keys 
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("noctalia msg brightness-up"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("noctalia msg brightness-down"),
    { locked = true, repeating = true })

-- Screenshots 
hl.bind(modShift .. " + S",hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy')) --region selection → clipboard
hl.bind("Print", hl.dsp.exec_cmd("grim - | wl-copy")) --full screen → clipboard
