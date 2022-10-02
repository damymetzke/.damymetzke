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
            layout = awful.layout.suit.tile.bottom,
            gap = 4,
            master_width_factor = 0.8,
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
            layout = awful.layout.suit.tile.bottom,
            gap = 4,
            master_width_factor = 0.8,
        })
    gameDevMode:defineTag("Visual", {
            layout = awful.layout.suit.max.fullscreen,
            gap = 0,
        })
    gameDevMode:defineTag("Audio", {
            layout = awful.layout.suit.max.fullscreen,
            gap = 0,
        })

    local documentMode = Mode:new(nil, "Documents", 10, "4")

    documentMode:defineTag("Terminal", {
            layout = awful.layout.suit.tile,
            gap = 4,
        })
    documentMode:defineTag("Browser", {
            layout = awful.layout.suit.max.fullscreen,
            gap = 0,
        })
    documentMode:defineTag("Document", {
            layout = awful.layout.suit.max.fullscreen,
            gap = 0,
        })
    documentMode:defineTag("Present", {
            layout = awful.layout.suit.max.fullscreen,
            gap = 0,
        })
    
    local presentationMode = Mode:new(nil, "Presentation", 10, "5")


    for i = 1,7 do
        presentationMode:defineTag("Present " .. i, {
                layout = awful.layout.suit.fair,
                gap = 0,
            })
    end

    for i = 1,2 do
        presentationMode:defineTag("Reference " .. i, {
                layout = awful.layout.suit.fair,
                gap = 4,
            })
    end

    presentationMode:defineTag("Terminal", {
            layout = awful.layout.suit.fair,
            gap = 4,
        })

    local result = ModeCollection:new()
    result:addMode(normalMode)
    result:addMode(webDevMode)
    result:addMode(gameDevMode)
    result:addMode(presentationMode)
    result:addMode(documentMode)

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
    result:addGlobalTag("Email", "e", {
            layout = awful.layout.suit.tile,
            gap = 8,
        })
    result:addGlobalTag("Whatsapp", "w", {
            layout = awful.layout.suit.tile,
            gap = 8,
        })

    return result
end

return setupModes
