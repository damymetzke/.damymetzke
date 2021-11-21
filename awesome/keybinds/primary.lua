local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Constants
local MOD_PRIMARY = "Mod1"
local MOD_SECONDARY = "Mod4"
local UTILITY_NAME = "utilities"

---MOVEMENT---
--------------
 
local utilityKeys = gears.table.join(
    awful.key({ MOD_SECONDARY, "Shift" }, "Slash", hotkeys_popup.show_help, {descriptiom = "Show Keybinds", group = UTILITY_NAME})
    )

root.keys( gears.table.join(
    utilityKeys
))
