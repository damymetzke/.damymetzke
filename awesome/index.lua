local awful = require("awful")
local keyGlobal = require "keybinds.global" 
local keyClient = require "keybinds.client" 
local setupModes = require "setupModes"

local index = {}

function index.run()

    require "default" 

    local modeKeys = setupModes.run()

    keyGlobal.setKeyBinds(modeKeys)
    keyClient.setKeyBinds()


    -- TODO: add this to a file
    awful.util.spawn("light-locker --late-locking --lock-on-lid --lock-on-suspend")
end

return index
