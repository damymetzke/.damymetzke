local gears = require "gears"
local awful = require "awful"
local modeTags = require "utils.modeTags"

local setupModes = {}

function setupModes.run()
    return gears.table.join(
        modeTags.addMode("Normal", function(defineTag)
            defineTag({
                    name = "Terminal",
                    layout = awful.layout.suit.tile,
                    gap = 4,
                })
            defineTag({
                    name = "Browser",
                    layout = awful.layout.suit.max.fullscreen,
                    gap = 0,
                })
            defineTag({
                    name = "Steam",
                    layout = awful.layout.suit.max,
                    gap = 0,
                })
        end, "1"),

        modeTags.addMode("Web Development", function() end, "2"),

        modeTags.addMode("Game Development", function() end, "3")
    )
end

return setupModes
