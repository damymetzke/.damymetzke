local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")
require("awful.hotkeys_popup.keys")

-- Constants
local MOD_PRIMARY = "Mod1"
local MOD_SECONDARY = "Mod4"
local UTILITY_NAME = "utilities"
local RUN_NAME = "run"
local TAG_NAME = "tags"

local utilityKeys = gears.table.join(
    -- Show help
    awful.key({ MOD_SECONDARY }, "h", hotkeys_popup.show_help, {description = "show help", group = UTILITY_NAME}),

    -- Lock screen
    awful.key({ MOD_SECONDARY}, "l",
        function() awful.util.spawn("i3lock -i /home/dmetzke/Pictures/lock_screen.png") end,
        {description="enable lock screen", group = UTILITY_NAME}),

    -- Main Menu
    awful.key({ MOD_PRIMARY,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = UTILITY_NAME}),
    -- Restart
    awful.key({ MOD_PRIMARY, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = UTILITY_NAME}),
    -- Quit
    awful.key({ MOD_PRIMARY, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = UTILITY_NAME})
    )

local runKeys = gears.table.join(
    -- Menu Bar
    awful.key({ MOD_PRIMARY }, "p", function() menubar.show() end,
              {description = "show the menubar", group = RUN_NAME}),

    -- Execute lua
    awful.key({ MOD_PRIMARY }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = RUN_NAME}),

    -- Run terminal
    awful.key({ MOD_PRIMARY }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = RUN_NAME}),

    -- Run prompt
    awful.key({ MOD_PRIMARY }, "r", function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = RUN_NAME})
    )


root.keys( gears.table.join(
    globalkeys,
    utilityKeys,
    runKeys,
    tagKeys
))
