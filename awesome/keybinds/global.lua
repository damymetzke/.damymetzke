local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")
local modeTags = require "utils.modeTags"
require("awful.hotkeys_popup.keys")

local global = {}

-- Constants
local MOD_PRIMARY = "Mod1"
local MOD_SECONDARY = "Mod4"
local UTILITY_NAME = "utilities"
local RUN_NAME = "run"
local LAYOUT_NAME = "layout"
local TAG_NAME = "tags"

local utilityKeys = gears.table.join(
    -- Show help
    awful.key({ MOD_SECONDARY }, "h", hotkeys_popup.show_help, {description = "show help", group = UTILITY_NAME}),

    -- Lock screen
    awful.key({ MOD_SECONDARY}, "l",
        function() awful.util.spawn(os.getenv("HOME") .. "/bin/lock") end,
        {description="enable lock screen", group = UTILITY_NAME}),

    -- Main Menu
    awful.key({ MOD_PRIMARY,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = UTILITY_NAME}),
    -- Restart
    awful.key({ MOD_PRIMARY, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = UTILITY_NAME}),
    -- Quit
    awful.key({ MOD_PRIMARY, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = UTILITY_NAME}),
    -- Toggle CapsLock 
    awful.key( {"Shift" }, "Shift_R",
        function() awful.util.spawn("xdotool key Caps_Lock") end,
        {description = "Toggle CapsLock", group = UTILITY_NAME}),
    awful.key( {"Shift" }, "Shift_L",
        function() awful.util.spawn("xdotool key Caps_Lock") end,
        {description = "Toggle CapsLock", group = UTILITY_NAME})
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

local layoutKeys = gears.table.join(
    -- Focus left
    awful.key({ MOD_PRIMARY }, "h", function() awful.client.focus.bydirection("left") end,
            { description = "Focus left", group = LAYOUT_NAME }),
    -- Focus right
    awful.key({ MOD_PRIMARY }, "l", function() awful.client.focus.bydirection("right") end,
            { description = "Focus right", group = LAYOUT_NAME }),
    -- Focus up
    awful.key({ MOD_PRIMARY }, "k", function() awful.client.focus.bydirection("up") end,
            { description = "Focus up", group = LAYOUT_NAME }),
    -- Focus down
    awful.key({ MOD_PRIMARY }, "j", function() awful.client.focus.bydirection("down") end,
            { description = "Focus down", group = LAYOUT_NAME }),
    -- Focus urgen
    awful.key({ MOD_PRIMARY }, "u", awful.client.urgent.jumpto,
              {description = "Focus urgent", group = LAYOUT_NAME }),

    -- Swap left
    awful.key({ MOD_PRIMARY, "Shift" }, "h", function() awful.client.swap.bydirection("left") end,
            { description = "Swap left", group = LAYOUT_NAME }),
    -- Swap right
    awful.key({ MOD_PRIMARY, "Shift" }, "l", function() awful.client.swap.bydirection("right") end,
            { description = "Swap right", group = LAYOUT_NAME }),
    -- Swap up
    awful.key({ MOD_PRIMARY, "Shift" }, "k", function() awful.client.swap.bydirection("up") end,
        { description = "Swap up", group = LAYOUT_NAME }),
    -- Swap down
    awful.key({ MOD_PRIMARY, "Shift" }, "j", function() awful.client.swap.bydirection("down") end,
            { description = "Swap down", group = LAYOUT_NAME }),
    -- Toggle to next layout
    awful.key({ MOD_PRIMARY }, "space", function () awful.layout.inc( 1) end,
            { description = "Toggle to next layout", group = LAYOUT_NAME }),

    -- Go to next screen, one button is enough as I ususally use up to 2 screens anyway
    awful.key({ MOD_PRIMARY }, "Tab", function() awful.screen.focus_relative(1) end,
            { description = "Focus next screen", group = LAYOUT_NAME }),

    -- Resize master
    awful.key({ MOD_PRIMARY, "Control" }, "j", function() awful.tag.incmwfact( 0.02) end,
            { description = "Increase master size", group = LAYOUT_NAME }),
    awful.key({ MOD_PRIMARY, "Control" }, "k", function() awful.tag.incmwfact( -0.02) end,
            { description = "Decrease master size", group = LAYOUT_NAME })
    )

local function getTagKey(modifier, key, tagIndex)
    return gears.table.join(
            -- Focus tag N
            awful.key({ modifier }, key,
                function ()
                    modeTags.focusTag(tagIndex)
                end,
                { description = "Focus tag", group = TAG_NAME }
                ),

            -- Toggle tag N
            awful.key({ modifier, "Control" }, key,
                function ()
                    local screen = awful.screen.focused()
                    local tag = screen.tags[tagIndex]
                    if tag then
                        awful.tag.viewtoggle(tag)
                    end
                end,
                { description = "Toggle tag", group = TAG_NAME }
                ),

            -- Move client to tag N
            awful.key({ modifier, "Shift" }, key,
                function ()
                    if client.focus then
                        local tag = client.focus.screen.tags[tagIndex]
                        if tag then
                            client.focus:move_to_tag(tag)
                            tag:view_only()
                        end
                    end
                end,
                { description = "Toggle tag", group = TAG_NAME }
                )
            )
end

local function getTagKeys(modifier, offset)
    local result = {}
    for i = 1, 10 do
        result = gears.table.join(result, getTagKey(modifier, "#" .. i + 9, i + offset))
    end
    return result
end

local tagKeys = getTagKeys(MOD_PRIMARY, 0)

local globalTagKeys = gears.table.join(
    -- getTagKeys(MOD_SECONDARY, 10),
    getTagKey(MOD_SECONDARY, "m", 21), -- Music
    getTagKey(MOD_SECONDARY, "u", 22), -- soUnd
    getTagKey(MOD_SECONDARY, "k", 23), -- Keepass
    getTagKey(MOD_SECONDARY, "w", 24), -- Wifi
    getTagKey(MOD_SECONDARY, "p", 25), -- Projection
    getTagKey(MOD_SECONDARY, "d", 26), -- Discord
    getTagKey(MOD_SECONDARY, "s", 27)  -- Slack
    )

local modeKeys = gears.table.join(
    awful.key({ MOD_SECONDARY }, "1",
        function()
            modeTags.setMode(1)
        end,
        { description = "Set mode", group = TAG_NAME}
        ),
    awful.key({ MOD_SECONDARY }, "2",
        function()
            modeTags.setMode(2)
        end,
        { description = "Set mode", group = TAG_NAME}
        ),
    awful.key({ MOD_SECONDARY }, "3",
        function()
            modeTags.setMode(3)
        end,
        { description = "Set mode", group = TAG_NAME}
        )
    )


function global.setKeyBinds()
    root.keys( gears.table.join(
        globalkeys,
        utilityKeys,
        runKeys,
        layoutKeys,
        tagKeys,
        globalTagKeys,
        modeKeys
    ))
end

return global
