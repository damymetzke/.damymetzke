local awful = require "awful"
local gears = require "gears"

local tesseract = require "damymetzke.tesseract.tesseract"

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
    mode.manager.tag_offset = self.endOffset
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
    local cube_sizes = {}

    for i, mode in pairs(self.modes) do
        if i == 1 then
            mode:generateTags(currentScreen, currentScreen.index)
        else
            mode:generateTags(currentScreen, 0)
        end

        cube_sizes[i] = mode.numTags
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

    self.tesseract = tesseract.new(cube_sizes)
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

    -- Tag locking
    for i = 2, 10, 1 do
        result = gears.table.join(result,
            awful.key({ MOD_PRIMARY, MOD_SECONDARY }, "#" .. i + 9,
                function()
                    self.tesseract:join_current_square_to_screen(i)
                end
                ),
            awful.key({ "Shift", MOD_SECONDARY }, "#" .. i + 9,
                function()
                    self.tesseract:disjoin_screen(i)
                end
                )
            )
    end

    return result
end

function ModeCollection:tagIsVisible(tag)
    return self.tesseract:square_is_visible(tag.index)
end

function ModeCollection:focusMode(i)
    self.currentMode = i
    self.tesseract:focus_mode(i)
end

function ModeCollection:focusTag(i)
    self.tesseract:focus_square(i)
end

function ModeCollection:moveClientToTag(i)
    self.tesseract:move_current_dot_to_square(i)
    --client.focus:move_to_tag(tag)
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
