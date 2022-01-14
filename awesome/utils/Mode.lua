local awful = require "awful"
local gears = require "gears"

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
    o.tagMemory = {}
    o.tagOrder = {}
    o.lockedTags = {}
    o.memory = {}

    for i = 1, numTags, 1 do
        table.insert(o.tagMemory, {
                currentScreen = 1,
            })
        table.insert(o.tagOrder, i)
    end

    return o
end

function Mode:generateTags(currentScreen, expectedIndex)
    for i = 1, self.numTags, 1 do
        if #self.tags < i then
            awful.tag.add("" .. (i % 10), {
                    layout = awful.layout.suit.tile,
                    master_fill_policy = "expand",
                    gap_single_client = true,
                    gap = 2,
                    screen = currentScreen,
                    selected = i == expectedIndex
                })
        else
            local tag = self.tags[i]
            awful.tag.add(tag.name, {
                    layout = tag.layout,
                    master_fill_policy = tag.master_fill_policy,
                    gap_single_client = tag.gap_single_client,
                    master_width_factor = tag.master_width_factor,
                    gap = tag.gap,
                    screen = currentScreen,
                    selected = i == expectedIndex
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
                master_width_factor = 0.5,
                gap_single_client = true,
                gap = 5,
        }, properties))

    return true
end

function Mode:focusTag(i)
    for j, tagIndex in pairs(self.tagOrder) do
        if tagIndex == i then
            for k = j - 1, 1, -1 do
                local swap = self.tagOrder[k]
                self.tagOrder[k] = self.tagOrder[k + 1]
                self.tagOrder[k + 1] = swap
            end
            break
        end
    end
    self:calculateTags()
end

function Mode:calculateTags()
    local i = 0
    local exemptTag = 0
    local lockSwapTag = 0
    for currentScreen in screen do
        if i == 0 then
            self:moveTagToScreen(self.tagOrder[1], currentScreen)
            if self:tagIsLocked(self.tagOrder[1]) then
                exemptTag = self.tagOrder[1]
                i = self:getNextFreeTag(1)
                lockSwapTag = self.tagOrder[i]
            else
                i = 1
            end
        else
            local lockedTag = self.lockedTags[currentScreen.index]
            if lockedTag then
                if lockedTag == exemptTag then
                    self:moveTagToScreen(lockSwapTag, currentScreen)
                else
                    self:moveTagToScreen(lockedTag, currentScreen)
                end
            else
                i = self:getNextFreeTag(i)
                self:moveTagToScreen(self.tagOrder[i], currentScreen)
            end
        end
    end
end

function Mode:moveTagToScreen(i, moveToScreen)
    local index = self.offset + i
    local focusTag = moveToScreen.tags[index]
    focusTag:view_only()
    if not(moveToScreen.index == self.tagMemory[i].currentScreen) then
        local fromTag = nil
        for currentScreen in screen do
            if currentScreen.index == self.tagMemory[i].currentScreen then
                fromTag = currentScreen.tags[index]
                break
            end
        end

        if fromTag == nil then
            focusTag:view_only()
            return
        end

        self.tagMemory[i].currentScreen = moveToScreen.index
        focusTag:swap(fromTag)
        fromTag:view_only()
        focusTag.selected = false
    end
end

function Mode:tagIsLocked(i)
    for _, tagIndex in pairs(self.lockedTags) do
        if tagIndex == i then
            return true
        end
    end
    return false
end

function Mode:getNextFreeTag(i)
    local j = i + 1
    while self:tagIsLocked(self.tagOrder[j]) do
        j = j + 1
    end
    return j
end

function Mode:lockCurrentTagToScreen(i)
    self.lockedTags[i] = self.tagOrder[1]
    self:focusTag(self.tagOrder[2])
end

function Mode:unlockScreen(i)
    self.lockedTags[i] = nil
    self:calculateTags()
end

return Mode
