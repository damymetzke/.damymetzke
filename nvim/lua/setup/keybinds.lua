-- `map` is used to create a key map.
local map = require'util.map'
-- `bind` will define the keys of a key map, but not the implementation.
-- The implementation can be defined somewhere else, at any time.
-- This is primarily used to support lazy loading plugins,
-- while keeping all key bindings in a single file
local bind = require'util.bridge_map'.bind

-- Leader <space> 
vim.g.mapleader = " "

-- Pressing * in visual mode will expand using the current selection rather than the current word
map("v", "*", "y/<C-R>\"<CR>")

-- Fix Y by selecting rest of the line instead of entire line
map("n", "Y", "y$")

-- Keep cursor centered when searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Keep cursor centered when J
map("n", "J", "myJ`y")

-- Undo break points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")
map("i", "?", "?<c-g>u")
map("i", "!", "!<c-g>u")
map("i", "|", "|<c-g>u")
map("i", "/", "/<c-g>u")
map("i", "\\", "\\<c-g>u")

-- Move lines quickly
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "<Leader>j", ":m .+1<CR>==")
map("n", "<Leader>k", ":m .-2<CR>==")

-- Quickfix list traversal
map("n", "<Leader>qj", ":cnext<CR>")
map("n", "<Leader>qk", ":cprevious<CR>")
map("n", "<Leader>ql", ":clast<CR>")
map("n", "<Leader>qh", ":cfirst<CR>")

-- NERDTree
bind("filetree:toggle", "n", "<leader>t")

-- rest.nvim
bind("rest_nvim:make_request", "n", "<leader>hr")

-- telescope.nvim
bind("telescope_nvim:open", "n", "<C-p>")
