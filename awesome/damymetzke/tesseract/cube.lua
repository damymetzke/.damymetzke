--- Manages multiple screens
--
-- @author Damy Metzke &lt;damy.metzke@gmail.com&gt;
-- @copyright 2022 Damy Metzke

local cube = {
  screens = {},
}

local awful = require "awful"

local screen_tag = require "damymetzke.tesseract.screen_tag"

-- Global screen reference.
-- TODO: Implement reordering of tags by user
-- FIXME: Squares that belong to a screen that was removed will still reference that screen
awful.screen.connect_for_each_screen(function(a_screen)
  table.insert(cube.screens, a_screen)

  a_screen:connect_signal("removed", function()
    cube.screens = {}
    for b_screen in screen do
      table.insert(cube.screens, b_screen)
    end
  end)
end)

--- Create a new cube
--
-- @param number_of_tags keep track of tags from 1 to and including number_of_tags
function cube.new(number_of_tags, tag_offset)
  cube.__index = cube

  local tag_order = {}
  local tags = {}

  for i = 1, number_of_tags, 1 do
    tag_order[i] = i
    tags[i] = screen_tag.new()
  end

  return setmetatable({
      tag_order = tag_order,
      tags = tags,
      tag_offset = tag_offset,
      joints = {},
    }, cube)
end

--- Move a tag to a specifc screen
--
-- @param tag_i index of tag to be moved
-- @param screen_i index of the screen the tag should be moved to
function cube:move_tag_to_screen(tag_i, screen_i)
  -- Don't do anything if the tag is already on the correct screen
  if screen_i == self.tags[tag_i].current_screen then
    return
  end

  local real_tag_i = self.tag_offset + tag_i

  local current_tag = self.screens[self.tags[tag_i].current_screen].tags[real_tag_i]
  local target_tag = self.screens[screen_i].tags[real_tag_i]

  for i, a_screen in pairs(self.screens) do
    if not(i == self.tags[tag_i].current_screen) then
      local clients = a_screen.tags[real_tag_i]:clients()
      for _, client in pairs(clients) do
        client:move_to_tag(current_tag)
      end
    end
  end

  self.tags[tag_i].current_screen = screen_i

  target_tag:swap(current_tag)
end

--- Move all tags to the correct screen, as defined by the tag order and locked tags
--
function cube:apply_tag_order()
  -- Calculate real order.
  -- First cycle only puts locked tags in
  local real_tag_order = {}
  local locked_tags = {}
  for i = 1, #self.screens, 1 do
    if self.joints[i] then
      real_tag_order[i] = self.joints[i]
      locked_tags[self.joints[i]] = i
    else
      real_tag_order[i] = 0

    end
  end

  -- second cycle, calculate sequence tags
  local tag_i = 1
  for i = 1, #self.screens, 1 do
    if real_tag_order[i] == 0 then
      while locked_tags[self.tag_order[tag_i]] do
        tag_i = tag_i + 1
      end
      real_tag_order[i] = self.tag_order[tag_i]
      tag_i = tag_i + 1
    end
  end

  -- Handle edge case where the first tag is locked to a different screen.
  -- This is the only scenario where a tag will not be placed in screen they are locked to.
  if locked_tags[self.tag_order[1]] then
    local swap_i = locked_tags[self.tag_order[1]]
    local swap = real_tag_order[1]
    real_tag_order[1] = real_tag_order[swap_i]
    real_tag_order[swap_i] = swap
  end

  -- Move all tags to the correct screen first.
  for i = 1, #self.screens, 1 do
    self:move_tag_to_screen(real_tag_order[i], i)
  end

  -- Select all tags for viewing.
  -- Done in a seperate loop to avoid buggy behavior in edge cases.
  for i = 1, #self.screens, 1 do
    self.screens[i].tags[self.tag_offset + real_tag_order[i]]:view_only()
  end

  -- Move cursor to the primary screen
  -- awful.screen.focus(self.screens[1].index)
  
  -- FIXME: Forcefully focus the client on the primary screen
end

--- Puts a tag at the front of the tag order.
--
-- This has the practical effect of displaying that tag on the primary monitor (focussing the tag)
function cube:focus_tag(tag_i)
  -- Don't do anything if tag is already focussed
  if self.tag_order[1] == tag_i then
    self:apply_tag_order()
    return
  end

  for i = 2, #self.tag_order, 1 do
    if self.tag_order[i] == tag_i then
      -- Move this tag to the front
      local swap = 0
      for j = i - 1, 1, -1 do
        swap = self.tag_order[j]
        self.tag_order[j] = self.tag_order[j + 1]
        self.tag_order[j + 1] = swap
      end
    end
  end

  self:apply_tag_order()
end

function cube:move_current_dot_to_square(square_i)
  local real_square_i = self.tag_offset + square_i
  local current_dot = client.focus
  current_dot:move_to_tag(awful.screen.focused().tags[real_square_i])

  self:focus_tag(square_i)
end

--- Join a tag to a screen
--
-- This will mean the tag will always be displayed on that screen.
-- The only exception to this is if the tag is the first on the tag order.
-- In this case it will be displayed on the primary screen.
function cube:join_tag_to_screen(tag_i, screen_i)
  self.joints[screen_i] = tag_i
  self:focus_tag(self.tag_order[2])
end

--- Join the currently selected tag to a screen
--
-- Wrapper for cube:join_tag_to_screen
function cube:join_current_tag_to_screen(screen_i)
  self:join_tag_to_screen(self.tag_order[1], screen_i)
end

--- Undoes the effect of cube:join_tag_to_screen
--
-- Any tag joined to that screen will no longer be joined.
function cube:disjoin_screen(screen_i)
  self.joints[screen_i] = nil
  self:apply_tag_order()
end

--- Get the number of tags
--
function cube:num_tags()
  return #self.tags
end

return cube

