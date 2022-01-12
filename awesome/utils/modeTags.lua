local awful = require "awful"
local gears = require "gears"
local ModeCollection = require "utils.ModeCollection"
local Mode = require "utils.Mode"
local naughty = require "naughty"

local modeTags = {}

local modeCollection = ModeCollection:new()

local currentMode = 1
local modes = {}
local modesSize = 0

local globalTags = {}

local MOD_SECONDARY = "Mod4"

local function tagFunction (mode)
    return function (name, properties)
        mode:defineTag(name, properties)
    end
end

function modeTags.tagIsVisible(tag)
    return modeCollection:tagIsVisible(tag)
end

function modeTags.addMode(name, tagsCallback, key)
    local newMode = Mode:new(nil, name, 10, key)
    modeCollection:addMode(newMode)
    tagsCallback(tagFunction(newMode))

    modesSize = modesSize + 1
    local modesIndex = modesSize

    return awful.key({ MOD_SECONDARY }, key,
        function ()
            modeTags.setMode(modesIndex)
        end,
        { description = "Set mode", group = "modes"}
    )
end

function modeTags.addGlobal(name, properties, key)
    table.insert(globalTags, gears.table.crush({
                name = name,
                layout = awful.layout.suit.tile,
                master_fill_policy = "expand",
                gap_single_client = true,
                gap = 15,
        }, properties))

    local globalIndex = #(globalTags)
    return gears.table.join(
        awful.key({ MOD_SECONDARY }, key,
            function ()
                modeTags.focusGlobal(globalIndex)
            end,
            { description = "Focus global tag", group = "global tags"}
            ),

        awful.key({ MOD_SECONDARY, "Shift" }, key,
            function ()
                modeTags.moveClientToGlobal(globalIndex)
            end,
            { description = "Move client to global tag", group = TAG_NAME }
            )
        )
end

function modeTags.setMode(i)
    modeCollection:focusMode(i)
end

function modeTags.focusGlobal(i)
    local screen = awful.screen.focused()
    local index = #(modeCollection.modes) * 10 + i
    local tag = screen.tags[index]
    if tag then
        tag:view_only()
    end
end

function modeTags.moveClientToGlobal(i)
    local index = #(modeCollection.modes) * 10 + i

    if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
            client.focus:move_to_tag(tag)
            tag:view_only()
        end
    end
end

function modeTags.focusTag(i)
    local currentScreen = awful.screen.focused()
    local mode = modeCollection.modes[modeCollection.currentMode]
    mode.memory[currentScreen.index] = i
    local tag = currentScreen.tags[mode.offset + i]
    if tag then
        tag:view_only()
    end
end

function modeTags.moveClientToTag(i)
    local mode = modeCollection.modes[modeCollection.currentMode]

    if client.focus then
        mode.memory[client.focus.screen.index] = i
        local tag = client.focus.screen.tags[mode.offset + i]
        if tag then
            client.focus:move_to_tag(tag)
            tag:view_only()
        end
    end
end

function modeTags.getModes()
    return modeCollection.modes
end

function modeTags.getGlobalTags()
    return globalTags
end

return modeTags
