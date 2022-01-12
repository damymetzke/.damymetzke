local naughty = require "naughty"

local ModeCollection = {
    modes = {},
    globalTags = {},
    endOffset = 0,
    currentMode = 1,
}

function ModeCollection:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    o.modes = {}
    o.globalTags = {}

    return o
end

function ModeCollection:addMode(mode)
    table.insert(self.modes, mode)
    mode.offset = self.endOffset
    self.endOffset = self.endOffset + 10
    return true
end

function ModeCollection:addGlobalTag(name, key, properties)
    table.insert(self.globalTags, gears.table.crush({
                name = name,
                layout = awful.layout.suit.tile,
                master_fill_policy = "expand",
                gap_single_client = true,
                gap = 5,
                globalIndex = #self.globalTags + 1
        }, properties))
end

function ModeCollection:tagIsVisible(tag)
    mode = self.modes[self.currentMode]
    if tag.index > mode.offset and tag.index <= mode.offset + mode.numTags then
        return true
    end

    if tag.index > self.endOffset then
        return tag.selected or #tag:clients() > 0
    end

    return false
end

function ModeCollection:focusMode(i)
    self.currentMode = i
    local mode = self.modes[i]
    local screensWithNoMemory = {}
    local usedIndexes = {}

    -- Get all screens with no memory
    for currentScreen in screen do
        local nextIndex = mode.memory[currentScreen.index]
        if nextIndex then
            usedIndexes[nextIndex] = true
        else
            table.insert(screensWithNoMemory, currentScreen)
        end
    end

    -- Create memory for new screens
    for _, currentScreen in pairs(screensWithNoMemory) do
        local j = 1
        while usedIndexes[j] do
            j = j + 1
        end
        usedIndexes[j] = true
        mode.memory[currentScreen.index] = j
    end

    -- Set the tags
    for currentScreen in screen do
        local index = mode.memory[currentScreen.index]
        local tag = currentScreen.tags[index + mode.offset]
        if tag then
            tag:view_only()
        end
    end

end

return ModeCollection
