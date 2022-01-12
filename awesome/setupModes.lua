local gears = require "gears"
local awful = require "awful"
local modeTags = require "utils.modeTags"

local setupModes = {}

function setupModes.run()
    return gears.table.join(
        modeTags.addMode("Normal", function(defineTag)
            defineTag("Terminal", {
                    layout = awful.layout.suit.tile,
                    gap = 4,
                })
            defineTag("Browser", {
                    layout = awful.layout.suit.max.fullscreen,
                    gap = 0,
                })
            defineTag("Games", {
                    layout = awful.layout.suit.max,
                    gap = 0,
                })
        end, "1"),

        modeTags.addMode("Web Development", function(defineTag)
            defineTag("Terminal", {
                    layout = awful.layout.suit.tile,
                    gap = 4,
                })
            defineTag("Browser", {
                    layout = awful.layout.suit.tile,
                    gap = 4,
                })
            defineTag("Dev Browser", {
                    layout = awful.layout.suit.tile,
                    gap = 4,
                })
            defineTag("Dev console", {
                    layout = awful.layout.suit.tile,
                    gap = 4,
                })
            defineTag("Server", {
                    layout = awful.layout.suit.tile,
                    gap = 4,
                })
            defineTag("Plan Board", {
                    layout = awful.layout.suit.tile,
                    gap = 4,
                })
        end, "2"),

        modeTags.addMode("Game Development", function(defineTag)
            defineTag("Terminal", {
                    layout = awful.layout.suit.tile,
                    gap = 4,
                })
            defineTag("Browser", {
                    layout = awful.layout.suit.tile,
                    gap = 4,
                })
            defineTag("Game Instance", {
                    layout = awful.layout.suit.tile,
                    gap = 4,
                })
            defineTag("Editor", {
                    layout = awful.layout.suit.tile,
                    gap = 4,
                })
            defineTag("Editor Terminal", {
                    layout = awful.layout.suit.tile,
                    gap = 4,
                })
            defineTag("Plan board", {
                    layout = awful.layout.suit.tile,
                    gap = 4,
                })
        end, "3"),
        
        modeTags.addGlobal("Music", {}, "m"),
        modeTags.addGlobal("Sound", {}, "u"),
        modeTags.addGlobal("Keepass", {}, "k"),
        modeTags.addGlobal("Project", {}, "p"),
        modeTags.addGlobal("Discord", {}, "d"),
        modeTags.addGlobal("Slack", {}, "s"),
        modeTags.getModeCollection():generateKeys()
    )
end

return setupModes
