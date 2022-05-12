--- Manages multiple cubes
--
-- At one time only 1 cube is considered active.
-- All functions labeled as 'Wrapper for cube' will call the active cube.
--
-- @author Damy Metzke &lt;damy.metzke@gmail.com&gt;
-- @copyright 2022 Damy Metzke

local tesseract = {
  active_cube = 1,
}

local cube = require "damymetzke.tesseract.cube"

---
--
-- Will automatically create cubes.
-- The number of cubes is the same as #cube_sizes
--
-- @param cube_sizes array of integers
function tesseract.new(cube_sizes)
  tesseract.__index = tesseract

  local cubes = {}

  local cube_offset = 0

  for i, cube_size in ipairs(cube_sizes) do
    cubes[i] = cube.new(cube_size, cube_offset)
    cube_offset = cube_offset + cube_size
  end

  return setmetatable({
      cubes = cubes,
      global_offset = cube_offset,
    }, tesseract)
end

function tesseract:get_active_cube()
  return self.cubes[self.active_cube]
end

---
--
-- @param mode_i index of the cube to be set to active.
function tesseract:focus_mode(mode_i)
  self.active_cube = mode_i
  self:get_active_cube():apply_tag_order()
end

---
--
-- Wrapper for cube
function tesseract:focus_square(square_i)
  self:get_active_cube():focus_tag(square_i)
end

---
--
-- Wrapper for cube
function tesseract:move_current_dot_to_square(square_i)
  self:get_active_cube():move_current_dot_to_square(square_i)
end

---
--
-- Wrapper for cube
function tesseract:join_current_square_to_screen(screen_i)
  self:get_active_cube():join_current_tag_to_screen(screen_i)
end

---
--
-- Wrapper for cube
function tesseract:disjoin_screen(screen_i)
  self:get_active_cube():disjoin_screen(screen_i)
end

--- 
--
-- @return true if the current square index is visible.
-- A square is considered visible if it is selectable by the current cube.
function tesseract:square_is_visible(real_square_i)
  local offset = self:get_active_cube().tag_offset
  if real_square_i > offset and real_square_i <= offset + self:get_active_cube():num_tags() then
    return true
  end

  -- TODO: Allow showing global squares when they are filled and/or selected
  return false
end

return tesseract
