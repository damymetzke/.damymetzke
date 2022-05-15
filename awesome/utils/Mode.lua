local awful = require "awful"
local gears = require "gears"
local screen_manager = require "damymetzke.tesseract.cube"
local generation = require "damymetzke.tesseract.generation"

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
    o.lockedTags = {}
    o.memory = {}
    o.manager = screen_manager.new(numTags, 0)

    for i = 1, numTags, 1 do
        table.insert(o.tagMemory, {
                currentScreen = 1,
            })
    end

    return o
end

function Mode:generateTags(currentScreen, expectedIndex)
    for i = 1, self.numTags, 1 do
        if #self.tags < i then
            generation.tag(currentScreen, tostring(i % 10), {
                    layout = awful.layout.suit.tile,
                    master_fill_policy = "expand",
                    gap_single_client = true,
                    gap = 2,
                    screen = currentScreen,
                    selected = i == expectedIndex
                })
        else
            local tag = self.tags[i]

            generation.tag(currentScreen, tag.name, {
                    layout = tag.layout,
                    master_fill_policy = tag.master_fill_policy,
                    gap_single_client = tag.gap_single_client,
                    master_width_factor = tag.master_width_factor,
                    gap = tag.gap,
                    screen = currentScreen,
                    selected = i == expectedIndex
                })
        end

        -- TODO: Implement this without the performance hits.
        -- Code for rounded corners for clients.
        -- Sadly the performance impact is too great.
        -- Initialization takes several seconds instead of a moment.
        -- New clients also have a slight delay when created.
        -- Lasty a fullscreen toggle takes about 2 seconds instead of almost instantly.
--      client.connect_signal("manage", function (newClient)
--          if newClient.fullscreen or newClient.maximized then
--              newClient.shape = gears.shape.rect
--          else
--              newClient.shape = function(cr, width, height)
--                  gears.shape.rounded_rect(cr, width, height, 5)
--              end
--          end
--      end)

--      client.connect_signal("property::fullscreen", function (newClient)
--          if newClient.fullscreen or newClient.maximized then
--              newClient.shape = gears.shape.rect
--          else
--              newClient.shape = function(cr, width, height)
--                  gears.shape.rounded_rect(cr, width, height, 5)
--              end
--          end
--      end)
    end
end

function Mode:defineTag(name, properties)
    if #(self.tags) >= self.numTags then
        return false
    end

    table.insert(self.tags, gears.table.crush({
                name = '[' .. name .. ']',
                layout = awful.layout.suit.tile,
                master_fill_policy = "expand",
                master_width_factor = 0.5,
                gap_single_client = true,
                gap = 5,
        }, properties))

    return true
end

return Mode
