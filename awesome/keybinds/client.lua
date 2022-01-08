local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")
local beautiful = require("beautiful")
require("awful.hotkeys_popup.keys")

local client = {}

-- Constants
local MOD_PRIMARY = "Mod1"
local MOD_SECONDARY = "Mod4"
local CLIENT_NAME = "client"

local clientKeys = gears.table.join(
    -- Toggle fullscreen
    awful.key({ MOD_PRIMARY }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "Toggle fullscreen", group = CLIENT_NAME}),

    -- Close
    awful.key({ MOD_SECONDARY }, "c", function (c) c:kill() end,
              {description = "Close", group = CLIENT_NAME}),

    -- Toggle floating
    awful.key({ MOD_PRIMARY, "Control" }, "f",  awful.client.floating.toggle                     ,
              {description = "Toggle floating", group = CLIENT_NAME}),

    -- Focus master
    awful.key({ MOD_PRIMARY, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "Focus master", group = CLIENT_NAME})
    )

function client.setKeyBinds()
  awful.rules.rules = {
      { rule = { },
        properties = { border_width = beautiful.border_width,
                       border_color = beautiful.border_normal,
                       focus = awful.client.focus.filter,
                       raise = true,
                       keys = clientKeys,
                       buttons = clientbuttons,
                       screen = awful.screen.preferred,
                       placement = awful.placement.no_overlap+awful.placement.no_offscreen
       }
      },
      -- TODO: move elsewhere
      -- Floating clients.
      { rule_any = {
          instance = {
            "DTA",  -- Firefox addon DownThemAll.
            "copyq",  -- Includes session name in class.
            "pinentry",
          },
          class = {
            "Arandr",
            "Blueman-manager",
            "Gpick",
            "Kruler",
            "MessageWin",  -- kalarm.
            "Sxiv",
            "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
            "Wpa_gui",
            "veromix",
            "xtightvncviewer"},

          -- Note that the name property shown in xprop might be set slightly after creation of the client
          -- and the name shown there might not match defined rules here.
          name = {
            "Event Tester",  -- xev.
          },
          role = {
            "AlarmWindow",  -- Thunderbird's calendar.
            "ConfigManager",  -- Thunderbird's about:config.
            "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
          }
        }, properties = { floating = true }},

      -- Add titlebars to normal clients and dialogs
      { rule_any = {type = { "normal", "dialog" }
        }, properties = { titlebars_enabled = true }
      },
  }
end

return client
