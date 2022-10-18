return function()
  local impl = require'util.bridge_map'.implement

  require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
      float = {
        enable = true,
      },
      adaptive_size = true,
      mappings = {
        list = {
          -- { key = "u", action = "dir_up" },
        },
      },
    },
    renderer = {
      group_empty = true,
      icons = {
        glyphs = {
          git = {
            -- unstaged = "~",
            -- untracked = "!",
            renamed = "",
          }
        },
      },
    },
    filters = {
      dotfiles = true,
    },
  })

  impl("filetree:toggle", ":NvimTreeToggle<CR>")
end
