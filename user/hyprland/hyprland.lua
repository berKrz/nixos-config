-- Program globals
terminal    = "kitty"
fileManager = "nautilus"

-- Monitor
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1.2,
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

