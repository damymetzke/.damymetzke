return function()
  local map = require'util/map'

  -- Open telescope
  map("n", "<C-p>", ":Telescope find_files hidden=true<CR>")
end
