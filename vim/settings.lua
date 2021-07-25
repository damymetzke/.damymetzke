-- Color scheme
vim.api.nvim_exec("colorscheme gruvbox", false)

-- Indentation
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.smartindent = true
vim.bo.smartindent = true

-- Text wrap
vim.o.wrap = false
vim.wo.wrap = false

-- Search highlight
vim.o.hlsearch = false

-- Sign column
-- Used by liners and Git Gutter

vim.o.signcolumn = "yes"
vim.wo.signcolumn = "yes"

-- Line numbers

vim.o.number = true
vim.wo.number = true
vim.o.relativenumber = true
vim.wo.relativenumber = true

-- Scoll sooner

vim.o.scrolloff = 6
vim.wo.scrolloff = 6

-- Backup and undo
vim.o.swapfile = false
vim.bo.swapfile = false
vim.o.undodir = vim.env.HOME .. "/.vim/undodir"
vim.o.undofile = true
vim.bo.undofile = true

-- Spell check language
vim.o.spelllang = "en_us"

-- Prettier
vim.api.nvim_set_var("prettier#autoformat_config_present", 1)
vim.api.nvim_set_var("prettier#autoformat_require_pragma", 0)
vim.api.nvim_exec("autocmd BufWritePre *.php Prettier", false)

-- Hidden files in NERDTree
vim.api.nvim_set_var("NERDTreeShowHidden", 1)

