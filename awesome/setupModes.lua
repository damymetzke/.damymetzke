local gears = require "gears"
local awful = require "awful"

local Mode = require "utils.Mode"
local ModeCollection = require "utils.ModeCollection"

local setupModes = {}

function setupModes.run()
    local normalMode = Mode:new(nil, "Normal", 10, "1")

    normalMode:defineTag("Terminal", {
            layout = awful.layout.suit.tile,
            gap = 4,
        })
    normalMode:defineTag("Browser", {
            layout = awful.layout.suit.max.fullscreen,
            gap = 0,
        })
    normalMode:defineTag("Games", {
            layout = awful.layout.suit.max,
            gap = 0,
        })

    local webDevMode = Mode:new(nil, "Web Development", 10, "2")

    webDevMode:defineTag("Terminal", {
            layout = awful.layout.suit.tile,
            gap = 4,
        })
    webDevMode:defineTag("Browser", {
            layout = awful.layout.suit.max.fullscreen,
            gap = 0,
        })
    webDevMode:defineTag("Dev Browser", {
            layout = awful.layout.suit.max.fullscreen,
            gap = 0,
        })
    webDevMode:defineTag("Dev Console", {
            layout = awful.layout.suit.tile,
            gap = 4,
        })
    webDevMode:defineTag("Server", {
            layout = awful.layout.suit.tile,
            gap = 4,
        })
    webDevMode:defineTag("Plan Board", {
            layout = awful.layout.suit.tile.top,
            gap = 4,
        })

    local gameDevMode = Mode:new(nil, "Game Development", 10, "3")

    gameDevMode:defineTag("Terminal", {
            layout = awful.layout.suit.tile,
            gap = 4,
        })
    gameDevMode:defineTag("Browser", {
            layout = awful.layout.suit.max.fullscreen,
            gap = 0,
        })
    gameDevMode:defineTag("Game Instance", {
            layout = awful.layout.suit.max.fullscreen,
            gap = 0,
        })
    gameDevMode:defineTag("Editor", {
            layout = awful.layout.suit.max.fullscreen,
            gap = 0,
        })
    gameDevMode:defineTag("Editor Terminal", {
            layout = awful.layout.suit.tile,
            gap = 4,
        })
    gameDevMode:defineTag("Plan Board", {
            layout = awful.layout.suit.tile.top,
            gap = 4,
        })

    local result = ModeCollection:new()
    result:addMode(normalMode)
    result:addMode(webDevMode)
    result:addMode(gameDevMode)

    result:addGlobalTag("Slack", "s", {
            layout = awful.layout.suit.tile,
            gap = 8,
        })
    result:addGlobalTag("Discord", "d", {
            layout = awful.layout.suit.tile,
            gap = 8,
        })
    result:addGlobalTag("Music", "m", {
            layout = awful.layout.suit.tile,
            gap = 8,
        })
    result:addGlobalTag("Sound", "u", {
            layout = awful.layout.suit.tile,
            gap = 8,
        })
    result:addGlobalTag("Bluetooth", "b", {
            layout = awful.layout.suit.tile,
            gap = 8,
        })
    result:addGlobalTag("Keepass", "k", {
            layout = awful.layout.suit.tile,
            gap = 8,
        })

    return result
end

return setupModes
