return function()
  local map = require'util/map'
  local telescope = require'telescope'

  -- Open telescope
  map("n", "<C-p>", ":Telescope find_files hidden=true<CR>")

  telescope.setup {
    extensions = {
      ["ui-select"] = {
        require'telescope.themes'.get_dropdown {
        }
      }
    }
  }

  telescope.load_extension("ui-select")
end
