return function()
  local map = require'util/map'

  -- Toggle NERDTree
  map("n", "<leader>t", ":NERDTreeToggle<CR>")
end
