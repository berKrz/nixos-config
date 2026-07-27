-- Keyboard and pointer
hl.config({
    input = {
        -- Dual layout: us (default) + br abnt2
        kb_layout  = "us,br",
        kb_variant = ",abnt2",
        kb_options = "grp:alt_shift_toggle",
        kb_model = "",
        kb_rules = "",

        -- 1 = focus follows cursor without click
        follow_mouse = 1,

        -- Pointer speed: -1.0 (slowest) to 1.0 (fastest), 0 = no adjustment
        sensitivity = 0,

       --touchpad = {
       --    natural_scroll      = true,
       --    disable_while_typing = true,
       --    tap-to-click        = true,
       --},
    },
})

-- Touchpad gestures
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

-- Per-device overrides
-- hl.device({
--     name        = "your-mouse-name",
--     sensitivity = -0.3,
-- })
