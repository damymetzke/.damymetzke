-- Color support
vim.opt.termguicolors = true

-- Color scheme
vim.api.nvim_set_var("gruvbox_guisp_fallback", "bg")
vim.api.nvim_set_var("gruvbox_transparent_bg", 1)
vim.api.nvim_exec("colorscheme gruvbox", false)
vim.api.nvim_exec("hi! Normal ctermbg=NONE guibg=NONE", false)

-- Only one 
vim.opt.laststatus = 4
vim.api.nvim_set_hl(0, "WinSeparator", {bg="none"})

-- Lsp messages
local redItalic = vim.api.nvim_get_hl_by_name("GruvboxRed", 0)
redItalic.italic = 1;

local orangeItalic = vim.api.nvim_get_hl_by_name("GruvboxOrange", 0)
orangeItalic.italic = 1;

local blueItalic = vim.api.nvim_get_hl_by_name("GruvboxBlue", 0)
blueItalic.italic = 1;

local aquaItalic = vim.api.nvim_get_hl_by_name("GruvboxAqua", 0)
aquaItalic.italic = 1;

vim.api.nvim_set_hl(0, "DiagnosticError", redItalic)
vim.api.nvim_set_hl(0, "DiagnosticWarn", orangeItalic)
vim.api.nvim_set_hl(0, "DiagnosticInfo", blueItalic)
vim.api.nvim_set_hl(0, "DiagnosticHint", aquaItalic)

vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
  link = "GruvboxOrangeUnderline"
})

-- Custom background
vim.api.nvim_set_hl(0, "NonEditor", {bg="#302e36"})

-- Comments
local commentItalic = vim.api.nvim_get_hl_by_name("Comment", 0)
commentItalic.italic = 1;

vim.api.nvim_set_hl(0, "Comment", commentItalic)

-- term gui colors
vim.o.termguicolors = 1

-- Indentation
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.smartindent = true
vim.bo.smartindent = true

-- 80 character 'limit'
vim.o.colorcolumn = "80"
vim.wo.colorcolumn = "80"

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

-- Hidden files in NERDTree
vim.api.nvim_set_var("NERDTreeShowHidden", 1)

-- Disable keybind timeout
vim.o.timeout = false

-- Reset spelling when new buffer is opened
vim.api.nvim_create_augroup("spell_set", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "spell_set",
    callback = function()
      if vim.b.should_spell == true then
        vim.wo.spell = true
      else  
        vim.wo.spell = false
      end
    end
})

