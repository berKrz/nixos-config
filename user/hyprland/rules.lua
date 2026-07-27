-- Always-on
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Float rules

hl.window_rule({
    name = "float-file-roller",
    match = { class = "^file-roller$" },
    float = true,
    size = "700 500",
})

hl.window_rule({
    name = "float-gnome-calculator",
    match = { class = "^gnome-calculator$" },
    float = true,
})

hl.window_rule({
    name = "float-gnome-connections",
    match = { class = "^gnome-connections$" },
    float = true,
})

-- Steam: float child windows (settings, popups) but not the main client window.
hl.window_rule({
    name = "float-steam-dialogs",
    match = { class = "^steam$", title = "^(?!Steam$).*" },
    float = true,
})

-- Picture-in-picture: pin and float for video players.
hl.window_rule({
    name = "float-pip",
    match = { title = "^[Pp]icture.in.[Pp]icture$" },
    float = true,
    pin = true,
})

