local awful = require("awful")
local keyGlobal = require "keybinds.global" 
local keyClient = require "keybinds.client" 
local modeTags = require "utils.modeTags"
local setupModes = require "setupModes"
local setupTags = require "setupTags"

local index = {}

function index.run()

    require "default" 

    local modeKeys = setupModes.run()
    awful.screen.connect_for_each_screen(function(currentScreen)
        -- setupTags.run(screen, modeTags.getModes(), modeTags.getGlobalTags())
        modeTags.getModeCollection():generateTags(currentScreen)
    end)

    keyGlobal.setKeyBinds(modeKeys)
    keyClient.setKeyBinds()


    -- TODO: add this to a file
    awful.util.spawn("light-locker --late-locking --lock-on-lid --lock-on-suspend")
end

return index
