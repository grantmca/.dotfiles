-- Hyprland native Lua config.
-- If this file exists, Hyprland loads it instead of hyprland.conf at startup.

----------------
-- Monitor
----------------

hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@60",
    position = "0x0",
    scale = 1.0,
})

----------------
-- Programs
----------------

local mod = "SUPER"
local term = "ghostty"
local menu = "wofi --show drun"

local function active_window_class()
    local window = hl.get_active_window()
    local class = window and window.class or ""

    return class:lower()
end

local function send_edit_shortcut(key)
    local class = active_window_class()

    if class:find("ghostty", 1, true) or class:find("kitty", 1, true) then
        if key == "a" then
            hl.exec_cmd("hyprctl dispatch sendshortcut SUPER,a,activewindow")
        elseif key == "c" then
            hl.exec_cmd("hyprctl dispatch sendshortcut CTRL,Insert,activewindow")
        elseif key == "v" then
            hl.exec_cmd("hyprctl dispatch sendshortcut SHIFT,Insert,activewindow")
        end

        return
    end

    if key == "a" or key == "c" or key == "v" or key == "x" then
        hl.exec_cmd("hyprctl dispatch sendshortcut CTRL," .. key .. ",activewindow")
    end
end

local function toggle_waybar()
    hl.exec_cmd("pkill -SIGUSR1 waybar")
end

----------------
-- Performance
----------------

hl.config({
    general = {
        border_size = 0,
        gaps_in = 0,
        gaps_out = 0,
        col = {
            active_border = "rgb(888888)",
            inactive_border = "rgb(000000)",
        },
        layout = "dwindle",
        allow_tearing = true,
    },

    decoration = {
        rounding = 0,
        blur = {
            enabled = false,
        },
        shadow = {
            enabled = false,
        },
    },

    animations = {
        enabled = false,
    },
})

----------------
-- Input
----------------

hl.config({
    input = {
        kb_layout = "us",
        kb_options = "caps:ctrl_modifier",
        follow_mouse = true,
        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.config({
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },

    binds = {
        allow_workspace_cycles = true,
    },
})

----------------
-- Autostart
----------------

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
end)

----------------
-- Keybindings
----------------

-- Window management
hl.bind(mod .. " + Return", hl.dsp.exec_cmd(term))
hl.bind(mod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + SHIFT + c", hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + Tab", hl.dsp.exec_cmd("hyprctl dispatch cyclenext"))
hl.bind(mod .. " + SHIFT + q", hl.dsp.exec_cmd("hyprctl dispatch exit"))
hl.bind(mod .. " + SHIFT + r", hl.dsp.exec_cmd("hyprctl reload"))

-- Workspace switching and moving.
for i = 1, 9 do
    hl.bind(mod .. " + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Ctrl+Left/Right workspace switching
hl.bind("CTRL + Right", hl.dsp.focus({ workspace = "+1" }))
hl.bind("CTRL + Left", hl.dsp.focus({ workspace = "-1" }))

-- Multi-monitor navigation (matching Yabai: alt for move/resize)
hl.bind("ALT + s", hl.dsp.focus({ monitor = -1 }))
hl.bind("ALT + g", hl.dsp.focus({ monitor = 1 }))
hl.bind("ALT + SHIFT + s", hl.dsp.window.move({ monitor = -1 }))
hl.bind("ALT + SHIFT + g", hl.dsp.window.move({ monitor = 1 }))

-- Close / quit
hl.bind(mod .. " + Q", hl.dsp.window.close())

-- macOS-style clipboard shortcuts without breaking terminal Ctrl+C
hl.bind(mod .. " + a", function()
    send_edit_shortcut("a")
end)
hl.bind(mod .. " + c", function()
    send_edit_shortcut("c")
end)
hl.bind(mod .. " + v", function()
    send_edit_shortcut("v")
end)
hl.bind(mod .. " + x", function()
    send_edit_shortcut("x")
end)

-- Toggle waybar
hl.bind(mod .. " + b", toggle_waybar)

----------------
-- Mouse bindings
----------------

hl.bind("ALT + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("ALT + mouse:273", hl.dsp.window.resize(), { mouse = true })

----------------
-- Gestures
----------------

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

----------------
-- Screenshot
----------------

-- This is OK for now, I want parity with macOS ideally.
hl.bind("Print", hl.dsp.exec_cmd("grim ~/Pictures/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd('grim -g "$(slurp)" ~/Pictures/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png'))
hl.bind("CTRL + Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))
