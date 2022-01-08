local awful = require("awful")
local keyGlobal = require "keybinds.global" 
local keyClient = require "keybinds.client" 
local modeTags = require "utils.modeTags"

local index = {}

function index.run()

    require "default" 

    keyGlobal.setKeyBinds()
    keyClient.setKeyBinds()

    -- TODO: add this to a file
    awful.util.spawn("light-locker --late-locking --lock-on-lid --lock-on-suspend")

    -- TODO: create a separate module to do this
    modeTags.addMode("first", function() end, "1")
    modeTags.addMode("second", function() end, "2")
end

return index
