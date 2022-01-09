local awful = require "awful"
local gears = require "gears"

local modeTags = {}

local currentMode = 1
local modes = {}
local modesSize = 0

local globalTags = {}

local MOD_SECONDARY = "Mod4"

local function tagFunction (name, properties)
    table.insert(modes[modesSize].tags, gears.table.crush({
            name = name,
            layout = awful.layout.suit.tile,
            master_fill_policy = "expand",
            gap_single_client = true,
            gap = 15,
        }, properties))
end

function modeTags.tagIsVisible(tag)
    if tag.index > (currentMode - 1) * 10 and tag.index <= currentMode * 10 then
        return true
    end

    if tag.index > #(modes) * 10 then
        return tag.selected or #tag:clients() > 0
    end

    return false
end

function modeTags.addMode(name, tagsCallback, key)
    key = key or ""
    modesSize = modesSize + 1
    modes[modesSize] = {
        name = name,
        tags = {},
        memory = {1},
        offset = 10 * (modesSize - 1),
        numTags = 10,
    }

    tagsCallback(tagFunction)

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
    currentMode = i
    local mode = modes[currentMode]
    modeTags.focusTag(mode.memory[1])
end

function modeTags.focusGlobal(i)
    local screen = awful.screen.focused()
    local index = #(modes) * 10 + i
    local tag = screen.tags[index]
    if tag then
        tag:view_only()
    end
end

function modeTags.moveClientToGlobal(i)
    local index = #(modes) * 10 + i

    if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
            client.focus:move_to_tag(tag)
            tag:view_only()
        end
    end
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

function modeTags.moveClientToTag(i)
    local mode = modes[currentMode]

    if client.focus then
        local tag = client.focus.screen.tags[mode.offset + i]
        if tag then
            client.focus:move_to_tag(tag)
            tag:view_only()
        end
    end
end

function modeTags.getModes()
    return modes
end

function modeTags.getGlobalTags()
    return globalTags
end

return modeTags
