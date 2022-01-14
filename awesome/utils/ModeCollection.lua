local awful = require "awful"
local gears = require "gears"

local MOD_SECONDARY = "Mod4"
local MOD_PRIMARY = "Mod1"
local MODE_NAME = "Mode"
local GLOBAL_NAME = "Global"
local TAG_NAME = "Global"

local ModeCollection = {
    modes = {},
    globalTags = {},
    endOffset = 0,
    currentMode = 1,
}

local stupidGlobal = nil

function ModeCollection.setStupidGlobal(value)
    stupidGlobal = value
end

function ModeCollection.stupidGlobal()
    return stupidGlobal
end

function ModeCollection:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    o.modes = {}
    o.globalTags = {}

    return o
end

function ModeCollection:getCurrentMode()
    return self.modes[self.currentMode]
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
                globalIndex = #self.globalTags + 1,
                key = key,
        }, properties))
end

function ModeCollection:generateTags(currentScreen)
    for i, mode in pairs(self.modes) do
        if i == 1 then
            mode:generateTags(currentScreen, currentScreen.index)
        else
            mode:generateTags(currentScreen, 0)
        end
    end

    for i, tag in pairs(self.globalTags) do
        awful.tag.add(tag.name, {
                layout = tag.layout,
                master_fill_policy = tag.master_fill_policy,
                gap_single_client = tag.gap_single_client,
                gap = tag.gap,
                screen = currentScreen,
                selected = false,
            })
    end
end

function ModeCollection:generateKeys()
    local result = {}
    for i, mode in pairs(self.modes) do
        if mode.key == "" then
            goto continue
        end

        result = gears.table.join(result, awful.key({ MOD_SECONDARY }, mode.key,
            function ()
                self:focusMode(i)
            end,
            { description = "Focus mode: '" .. mode.name .. "'", group = MODE_NAME }))

        ::continue::
    end

    for i, tag in pairs(self.globalTags) do
        result = gears.table.join(result,
            awful.key({ MOD_SECONDARY }, tag.key,
            function ()
                self:focusGlobalTag(i)
            end,
            { description = "Focus global tag: '" .. tag.name .. "'", group = GLOBAL_NAME }),
            awful.key({ MOD_SECONDARY, "Shift" }, tag.key,
            function ()
                self:moveClientToGlobalTag(i)
            end,
            { description = "Move client to global tag: '" .. tag.name .. "'", group = GLOBAL_NAME })
        )
    end

    for i = 1, 10 do
        result = gears.table.join(result,
            awful.key({ MOD_PRIMARY }, "#" .. i + 9,
            function ()
                self:focusTag(i)
            end,
            { description = "Focus tag", group = TAG_NAME }),
            awful.key({ MOD_PRIMARY, "Shift" }, "#" .. i + 9,
            function ()
                self:moveClientToTag(i)
            end,
            { description = "Move client to tag", group = TAG_NAME })
        )
    end

    return result
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
    self:getCurrentMode():calculateTags()
end

function ModeCollection:focusTag(i)
    self:getCurrentMode():focusTag(i)
end

function ModeCollection:moveClientToTag(i)
    local index = self:getCurrentMode().offset + i

    if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
            client.focus:move_to_tag(tag)
            tag:view_only()
        end
    end
end

function ModeCollection:focusGlobalTag(i)
    local focusedScreen = awful.screen.focused()
    local index = self.endOffset + i
    local tag = focusedScreen.tags[index]
    if tag then
        tag:view_only()
    end
end

function ModeCollection:moveClientToGlobalTag(i)
    local index = self.endOffset + i

    if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
            client.focus:move_to_tag(tag)
            tag:view_only()
        end
    end
end

return ModeCollection
