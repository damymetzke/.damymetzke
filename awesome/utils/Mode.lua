local awful = require "awful"
local gears = require "gears"

local Mode = {
    name = "",
    offset = 0,
    numTags = 10,
    tags = {},
    memory = {},
}

function Mode:new(o, name, offset, numTags)
    o is o or {}
    setmetatable(o, self)
    self.__index = self

    self.name = name
    self.offet = offset
    self.numTags = numTags
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
        }))

    return true
end

return Mode
