return function()
  local telescope = require'telescope'
  local impl = require'util.bridge_map'.implement

  telescope.setup {
    extensions = {
      ["ui-select"] = {
        require'telescope.themes'.get_dropdown {
        }
      }
    }
  }

  telescope.load_extension("ui-select")

  -- Open telescope
  impl("telescope_nvim:open", ":Telescope find_files hidden=true<CR>")
end
