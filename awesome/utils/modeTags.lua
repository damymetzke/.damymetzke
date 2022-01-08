local awful = require "awful"

local modeTags = {}

local currentMode = 1
local modes = {}
local modesSize = 0

local function tagFunction()
    return function ()
    end
end

function modeTags.addMode(name, tagsCallback, key)
    key = key or ""
    modesSize = modesSize + 1
    modes[modesSize] = {
        name = name,
        tags = tagsCallback(tagFunction()),
        memory = {1},
        offset = 10 * (modesSize - 1)
    }
end

function modeTags.setMode(i)
    currentMode = i
    local mode = modes[currentMode]
    modeTags.focusTag(mode.memory[1])
end

function modeTags.focusTag(i)
    local screen = awful.screen.focused()
    local mode = modes[currentMode]
    mode.memory[1] = i
    local tag = screen.tags[mode.offset + i]
    if tag then
        tag:view_only()
    end
end

return modeTags
