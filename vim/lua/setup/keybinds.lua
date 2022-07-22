local map = require'util/map'

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
