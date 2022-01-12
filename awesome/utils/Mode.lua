local awful = require "awful"
local gears = require "gears"

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

function Mode:generateTags()

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
