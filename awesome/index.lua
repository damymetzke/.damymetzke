local awful = require("awful")
local keyGlobal = require "keybinds.global" 
local keyClient = require "keybinds.client" 
local modeTags = require "utils.modeTags"
local setupModes = require "setupModes"
local setupTags = require "setupTags"
local ModeCollection = require "utils.ModeCollection"

local index = {}

function index.run()

    require "default" 

    local modeCollection = setupModes.run()

    ModeCollection.setStupidGlobal(modeCollection)

    awful.screen.connect_for_each_screen(function(currentScreen)
        -- setupTags.run(screen, modeTags.getModes(), modeTags.getGlobalTags())
        modeCollection:generateTags(currentScreen)
    end)

    keyGlobal.setKeyBinds(modeCollection:generateKeys())
    keyClient.setKeyBinds()


    -- TODO: add this to a file
    awful.util.spawn("light-locker --late-locking --lock-on-lid --lock-on-suspend")

    awful.util.spawn(os.getenv("HOME") .. "/.local/share/damymetzke/startup")
end

return index
