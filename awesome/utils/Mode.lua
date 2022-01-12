local awful = require "awful"
local gears = require "gears"

local naughty = require "naughty"

local MOD_SECONDARY = "Mod4"
local MODE_NAME = "Mode"

local Mode = {
    offset = 0
}

function Mode:new(o, name, numTags, key)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    o.name = name
    o.numTags = numTags
    o.key = key or ""
    o.tags = {}
    o.memory = {}

    return o
end

function Mode:generateTags(currentScreen, isFirstTag)
    for i = 1, self.numTags, 1 do
        if #self.tags < i then
            awful.tag.add("" .. (i % 10), {
                    layout = awful.layout.suit.tile,
                    master_fill_policy = "expand",
                    gap_single_client = true,
                    gap = 2,
                    screen = currentScreen,
                    selected = (i == 1) and isFirstTag,
                })
        else
            naughty.notify({text = "" .. #self.tags .. " - " .. i})
            local tag = self.tags[i]
            awful.tag.add(tag.name, {
                    layout = tag.layout,
                    master_fill_policy = tag.master_fill_policy,
                    gap_single_client = tag.gap_single_client,
                    gap = tag.gap,
                    screen = currentScreen,
                    selected = (i == 1) and isFirstTag
                })
        end
    end
end

function Mode:defineTag(name, properties)
    if #(self.tags) >= self.numTags then
        return false
    end

    table.insert(self.tags, gears.table.crush({
                name = name,
                layout = awful.layout.suit.tile,
                master_fill_policy = "expand",
                gap_single_client = true,
                gap = 5,
        }, properties))

    return true
end

return Mode
