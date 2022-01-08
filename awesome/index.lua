local awful = require("awful")
local keyGlobal = require "keybinds.global" 
local keyClient = require "keybinds.client" 

local index = {}

function index.run()

    require "default" 

    keyGlobal.setKeyBinds()
    keyClient.setKeyBinds()

    -- TODO: add this to a file
    awful.util.spawn("light-locker --late-locking --lock-on-lid --lock-on-suspend")
end

return index
