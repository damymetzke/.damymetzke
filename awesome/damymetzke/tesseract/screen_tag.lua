--- Defines a tag from the perspective of the screen manager
-- 
-- @author Damy Metzke &lt;damy.metzke@gmail.com&gt;
-- @copyright 2022 Damy Metzke

local screen_tag = {
  current_screen = 1
}

--- Create a new screen_tag
--
-- @param number_of_tags keep track of tags from 1 to and including number_of_tags
function screen_tag.new()
  screen_tag.__index = screen_tag
  return setmetatable({ }, screen_tag)
end

return screen_tag
