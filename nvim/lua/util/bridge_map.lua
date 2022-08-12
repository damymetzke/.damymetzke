local map = require'util.map'

-- Create key maps in 2 parts:
-- The binding and the implementation
-- This means these can be defined at different times
-- The primary purpose is to allow late implementations of plugins
local bridge_map = {}

local bindings = vim.g.bridge_map_bindings
local implementations = vim.g.bridge_map_implementations

bindings = {}
implementations = {}

-- Call this to bind a key to a `name`
function bridge_map.bind(name, mode, keys)
  if implementations[name] == nil then
    bindings[name] = {mode, keys}
  else
    map(mode, keys, implementations[name])
    implementations[name] = nil
  end
end

-- Call this to bind an implementation to a `name`
function bridge_map.implement(name, command)
  if bindings[name] == nil then
    implementations[name] = command
  else
    map(bindings[name][1], bindings[name][2], command)
    bindings[name] = nil
  end
end

return bridge_map
