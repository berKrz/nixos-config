-- Program globals
terminal = "kitty"
fileManager = "nautilus"

-- Monitor
hl.monitor({
    output = "eDP-1",
    mode = "1920x1080",
    position = "0x0",
    scale = 1.2,
})

-- Fixing Steam low Resolution
hl.config({
    xwayland = {
    	force_zero_scaling = true,
    }
})

-- Noctalia Start
hl.on("hyprland.start", function()
	hl.exec_cmd("noctalia --daemon")
end)

-- Modules
require("visuals")
require("input")
require("rules")
require("binds")





-- For Noctalia Color templates
require("noctalia").apply_theme()
