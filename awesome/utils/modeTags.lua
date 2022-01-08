local awful = require "awful"

local modeTags = {}

local currentMode = 1

function modeTags.setMode(i)
    currentMode = i
end

function modeTags.focusTag(i)
    local screen = awful.screen.focused()
    local tag = screen.tags[i + (10 * (currentMode - 1))]
    if tag then
        tag:view_only()
    end
end

return modeTags
