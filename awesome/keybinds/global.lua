local gears = require("gears")
local wibox = require("wibox")
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

-- pactl get-sink-volume @DEFAULT_SINK@ | awk 'NR==1{print $5}'

function get_volume()
  fperc = assert(io.popen("pactl get-sink-volume @DEFAULT_SINK@ | awk 'NR==1{print $5}'", "r"))
  local perc = fperc:read("*a")
  fperc:close()
  return string.gsub(perc, "\n", "")
end

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
        {description = "Toggle CapsLock", group = UTILITY_NAME}),

    -- Screenshots
    awful.key( { }, "Print",
        function() awful.util.spawn("screenshot") end,
        {description = "Take screenshot", group = UTILITY_NAME}),
    
    awful.key( { MOD_SECONDARY }, "q",
        function()
awful.popup {
    widget = {
        {
            {
                text   = "Volume: " .. get_volume(),
                widget = wibox.widget.textbox
            },
            layout = wibox.layout.fixed.vertical,
        },
        margins = 5,
        widget  = wibox.container.margin
    },
    bg = "#4eb19d",
    border_color = '#4e8382',
    border_width = 1,
    placement    = function(d) awful.placement.top_left(d, {margins = 30}) end,
    shape        = gears.shape.rect,
    visible      = true,
    ontop = true,
}
    end,
        {description = "Test", group = UTILITY_NAME}),

    -- Volume
    awful.key( { MOD_SECONDARY }, "Up",
      function()
        awful.util.spawn("pactl set-sink-volume @DEFAULT_SINK@ +2%")
        awful.popup {
          widget = {
            {
              {
                text = get_volume(),
                widget = wibox.widget.textbox,
              },
              layout = wibox.layout.fixed.vertical,
            },
          },
          placement = awful.placement.top_left,
          shape = gears.shape.rect,
          visible = true,
        }
      end,
        {description = "Volume up", group = UTILITY_NAME}),
    awful.key( { MOD_SECONDARY }, "Down",
        function() awful.util.spawn("pactl set-sink-volume @DEFAULT_SINK@ -2%") end,
        {description = "Volume down", group = UTILITY_NAME})
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
    awful.key({ MOD_PRIMARY }, "Return", function () awful.spawn("bash -c \"WINIT_X11_SCALE_FACTOR=1 alacritty -e tmux new -A -s root\"") end,
              {description = "open a tmux session in a new terminal", group = RUN_NAME}),
    -- Attach terminal
    awful.key({ MOD_PRIMARY, "Shift" }, "Return", function () awful.spawn("bash -c \"WINIT_X11_SCALE_FACTOR=1 alacritty\"") end,
              {description = "open a terminal", group = RUN_NAME}),

    awful.key({ MOD_PRIMARY }, "e", function () awful.spawn('bash -c "$BROWSER"') end,
              {description = "open the web browser", group = RUN_NAME}),

    -- Run prompt
    awful.key({ MOD_PRIMARY }, "r", function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = RUN_NAME}),

    -- Run `grass cs`
    awful.key({ MOD_PRIMARY }, "s", function ()
        awful.spawn("alacritty -e grass cs", {
          floating = true,
          placement = awful.placement.centered
          })
      end,
      {description = "Select a repository and create a session", group = RUN_NAME})
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

            -- Move client to tag N
            awful.key({ modifier, "Shift" }, key,
                function ()
                    modeTags.moveClientToTag(tagIndex)
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

function global.setKeyBinds(otherKeys)
    root.keys( gears.table.join(
        globalkeys,
        utilityKeys,
        runKeys,
        layoutKeys,
        otherKeys
    ))
end

return global
