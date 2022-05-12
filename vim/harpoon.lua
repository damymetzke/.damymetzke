local telescope = require "telescope"
local mark = require "harpoon.mark"

-- Enable plugin in telescope
telescope.load_extension("harpoon")

-- Set keybinds --

-- Set mark
-- vim.api.nvim_set_keymap("n", "mm", "", {
--   noremap = true,
--   silent = true,
--   callback = function ()
--     mark.add_file()
--   end,
-- })

-- View marks using Telescope
vim.api.nvim_set_keymap("n", "gm", ":Telescope harpoon marks<CR>", {noremap = true, silent = true})
