-- Bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer itself
  use 'wbthomason/packer.nvim'

  -- Gruvbox theme
  use 'gruvbox-community/gruvbox'

  -- LSP configuration
  use {
    'neovim/nvim-lspconfig',
    config = require'config.nvim_lspconfig',
  }

  -- File explorer
  use {
    'scrooloose/NERDTree',
    config = require'config.nerdtree',
  }

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = {{ 'nvim-lua/plenary.nvim' }, { 'nvim-telescope/telescope-ui-select.nvim' }},
    config = require'config.telescope_nvim',
  }

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = require'config.lualine_nvim',
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
      {'hrsh7th/cmp-nvim-lua'},
      {'saadparwaiz1/cmp_luasnip'},
      {'onsails/lspkind.nvim'}
    },
    config = require'config.nvim_cmp',
  }

  -- Snippet engine
  use {
    'L3MON4D3/LuaSnip',
    config = require'config.luasnip',
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = require'config.trouble_nvim',
  }

  -- Todo comments
  use {
    'folke/todo-comments.nvim',
    requires = {{ 'nvim-lua/plenary.nvim' }},
    config = require'config.todo_comments_nvim',
  }

  -- Treesitter for better syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = require'config.nvim_treesitter',
  }

  -- Java LSP support
  use 'mfussenegger/nvim-jdtls'

  use {
    'ldelossa/litee.nvim',
    config = require'config.litee_nvim',
  }

  -- Gh commands from within vim
  use {
    'ldelossa/gh.nvim',
    requires = {{ 'ldelossa/litee.nvim' }},
    config = require'config.gh_nvim',
  }

  -- HTTP request client
  --
  -- Important: this is a fork maintained by a random person.
  -- This is because the original repo has a bug and it seems development has stopped.
  -- See: https://github.com/NTBBloodbath/rest.nvim/issues/114
  -- I manually checked the commit, and there is no malicious code.
  -- However it would be ill adviced to blindly trust this person, so I locked the commit.
  use {
    "teto/rest.nvim",
    commit = "753c4e597b595d42912af04fc02a92fc19af77d2",
    requires = { "nvim-lua/plenary.nvim" },
    config = require'config.rest_nvim',
  }

  -- Finish bootstrap
  if packer_bootstrap then
    require('packer').sync()
  end
end)
