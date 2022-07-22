-- Telescope (ctrl+p)
vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files hidden=true<CR>", {noremap = true, silent = true})


-- Leader <space> 
vim.g.mapleader = " "

-- Toggle NERDTree
vim.api.nvim_set_keymap("n", "<leader>t", ":NERDTreeToggle<CR>", {noremap = true, silent = true})

-- Pressing * in visual mode will expand using the current selection rather than the current word
vim.api.nvim_set_keymap("v", "*", "y/<C-R>\"<CR>", {noremap = true, silent = true})

-- Fix Y by selecting rest of the line instead of entire line
vim.api.nvim_set_keymap("n", "Y", "y$", {noremap = true, silent = true})

-- Keep cursor centered when searching
vim.api.nvim_set_keymap("n", "n", "nzzzv", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "N", "Nzzzv", {noremap = true, silent = true})

-- Keep cursor centered when J
vim.api.nvim_set_keymap("n", "J", "myJ`y", {noremap = true, silent = true})

-- Undo break points
vim.api.nvim_set_keymap("i", ",", ",<c-g>u", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", ".", ".<c-g>u", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", ";", ";<c-g>u", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "?", "?<c-g>u", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "!", "!<c-g>u", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "|", "|<c-g>u", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "/", "/<c-g>u", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "\\", "\\<c-g>u", {noremap = true, silent = true})

-- Move lines quickly
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>j", ":m .+1<CR>==", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>k", ":m .-2<CR>==", {noremap = true, silent = true})

-- Quickfix list traversal
vim.api.nvim_set_keymap("n", "<Leader>qj", ":cnext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>qk", ":cprevious<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>ql", ":clast<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>qh", ":cfirst<CR>", {noremap = true, silent = true})
