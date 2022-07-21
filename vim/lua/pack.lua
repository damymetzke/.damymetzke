-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer itself
  use 'wbthomason/packer.nvim'

  -- Gruvbox theme
  use 'gruvbox-community/gruvbox'

  -- LSP configuration
  use 'neovim/nvim-lspconfig'

  -- File explorer
  use 'scrooloose/NERDTree'

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = {{ 'nvim-lua/plenary.nvim' }},
  }

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Emmet expansion
  use 'mattn/emmet-vim'

  -- See which lines are changed in git repository when editing files
  use 'airblade/vim-gitgutter'

  -- Git commands from within vim
  use 'tpope/vim-fugitive'

  -- Completion engine
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'saadparwaiz1/cmp_luasnip'}
    }
  }

  -- Snippet engine
  use 'L3MON4D3/LuaSnip'

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  -- Todo comments
  use 'folke/todo-comments.nvim'

  -- Treesitter for better syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- Java LSP support
  use 'mfussenegger/nvim-jdtls'

  -- Gh commands from within vim
  use {
    'ldelossa/gh.nvim',
    requires = {{ 'ldelossa/litee.nvim' }}
  }
end)
