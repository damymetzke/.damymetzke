-- FZF (ctrl+p)
vim.api.nvim_set_keymap("n", "<C-p>", ":FZF<CR>", {noremap = true, silent = true})

-- Leader <space> 
vim.g.mapleader = " "

-- Toggle NERDTree
vim.api.nvim_set_keymap("n", "<leader>t", ":NERDTreeToggle<CR>", {noremap = true, silent = true})

-- Open a new Bash instance.
-- Will also load user profile.
vim.api.nvim_set_keymap("n", "<leader>b", ":term NO_DEFAULT_SSH=0 bash -l<CR>a", {noremap = true, silent = true})

-- Toggle spell checking
vim.api.nvim_set_keymap("n", "<leader>s", ":setlocal nospell! nospell?<CR>", {noremap = true, silent = false})

-- Emmet
vim.api.nvim_set_keymap("n", "<leader>m", "<C-y>", {noremap = true, silent = true})

-- Pressing * in visual mode will expand using the current selection rather than the current word
vim.api.nvim_set_keymap("v", "*", "y/<C-R>\"<CR>", {noremap = true, silent = true})

-- Unbind arrow keys
vim.api.nvim_set_keymap("n", "<Left>", ":echo \"No! Don't use the arrow keys! Bad!\"<CR>", {noremap = true, silent = false})
vim.api.nvim_set_keymap("n", "<Right>", ":echo \"No! Don't use the arrow keys! Bad!\"<CR>", {noremap = true, silent = false})
vim.api.nvim_set_keymap("n", "<Up>", ":echo \"No! Don't use the arrow keys! Bad!\"<CR>", {noremap = true, silent = false})
vim.api.nvim_set_keymap("n", "<Down>", ":echo \"No! Don't use the arrow keys! Bad!\"<CR>", {noremap = true, silent = false})

vim.api.nvim_set_keymap("v", "<Left>", "<Nop>", {noremap = true, silent = false})
vim.api.nvim_set_keymap("v", "<Right>", "<Nop>", {noremap = true, silent = false})
vim.api.nvim_set_keymap("v", "<Up>", "<Nop>", {noremap = true, silent = false})
vim.api.nvim_set_keymap("v", "<Down>", "<Nop>", {noremap = true, silent = false})

vim.api.nvim_set_keymap("i", "<Left>", "<Esc>:echo \"No! Don't use the arrow keys! Bad!\"<CR>a", {noremap = true, silent = false})
vim.api.nvim_set_keymap("i", "<Right>", "<Esc>:echo \"No! Don't use the arrow keys! Bad!\"<CR>a", {noremap = true, silent = false})
vim.api.nvim_set_keymap("i", "<Up>", "<Esc>:echo \"No! Don't use the arrow keys! Bad!\"<CR>a", {noremap = true, silent = false})
vim.api.nvim_set_keymap("i", "<Down>", "<Esc>:echo \"No! Don't use the arrow keys! Bad!\"<CR>a", {noremap = true, silent = false})

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
