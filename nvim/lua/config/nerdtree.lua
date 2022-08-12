return function()
  local impl = require'util.bridge_map'.implement

  -- Toggle NERDTree
  impl("nerdtree:toggle", ":NERDTreeToggle<CR>")
end
