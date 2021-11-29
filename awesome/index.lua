local awful = require("awful")
-- package.path = package.path .. ";" .. os.getenv("HOME") .. "/.damymetzke/awesome"

-- require("default")
dofile(os.getenv("HOME") .. "/.damymetzke/awesome/default.lua")

dofile(os.getenv("HOME") .. "/.damymetzke/awesome/keybinds/global.lua")
dofile(os.getenv("HOME") .. "/.damymetzke/awesome/keybinds/client.lua")

-- TODO: add this to a file
awful.util.spawn("light-locker --late-locking --lock-on-lid --lock-on-suspend")

