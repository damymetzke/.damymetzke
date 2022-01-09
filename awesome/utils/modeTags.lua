local awful = require "awful"
local gears = require "gears"

local modeTags = {}

local currentMode = 1
local modes = {}
local modesSize = 0

local MOD_SECONDARY = "Mod4"

local function tagFunction (properties)
    table.insert(modes[modesSize].tags, gears.table.crush({
            name = "Tag #",
            layout = awful.layout.suit.tile,
            master_fill_policy = "expand",
            gap_single_client = true,
            gap = 15,
        }, properties))
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

function modeTags.getModes()
    return modes
end

return modeTags
