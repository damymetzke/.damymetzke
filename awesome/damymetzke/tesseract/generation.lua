--- Collection of function to generate Awesome content
--
-- @author Damy Metzke &lt;damy.metzke@gmail.com&gt;
-- @copyright 2022 Damy Metzke

local generation = {}

local awful = require "awful"

--- Generate a tag and add it to the proveded screen
--
function generation.tag(a_screen, name, properties)
  local tag_instance = awful.tag.add(name, properties)
end

return generation
