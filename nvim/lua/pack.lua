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
--  use {
--    'scrooloose/NERDTree',
--    keys = {
--      {"n", "<leader>t"},
--    },
--    config = require'config.nerdtree',
--  }

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly',
    keys = {
      {"n", "<leader>t"},
    },
    config = require'config.nvim_tree_lua',
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

  use 'nvim-treesitter/playground'

  -- Java LSP support
  use {
    'mfussenegger/nvim-jdtls',
    module = { "share.jdtls" },
  }

  use {
    'ldelossa/litee.nvim',
    config = require'config.litee_nvim',
  }

  -- Gh commands from within vim
  use {
    'ldelossa/gh.nvim',
    requires = {{ 'ldelossa/litee.nvim' }},
    -- NOTE: This won't work as well if the plugin author changes the commands.
    --       Perhaps it would make sense to programatically generate this list.
    cmd = {
      'GH',
      'GHOpenPR',
      'GHOpenPR',
      'GHOpenToPR',
      'GHPopOutPR',
      'GHOpenToCommit',
      'GHPopOutCommit',
      'GHCollapsePR',
      'GHExpandPR',
      'GHCollapseCommit',
      'GHExpandCommit',
      'GHCollapseReview',
      'GHExpandReview',
      'GHRefreshPR',
      'GHRefreshComments',
      'GHRefreshIssues',
      'GHRefreshNotifications',
      'GHStartReview',
      'GHSubmitReview',
      'GHDeleteReview',
      'GHApproveReview',
      'GHPRDetails',
      'GHToggleThreads',
      'GHNextThread',
      'GHCreateThread',
      'GHClosePR',
      'GHCloseReview',
      'GHAddLabel',
      'GHViewWeb',
      'GHRequestedReview',
      'GHSearchPRs',
      'GHNotifications',
    },
    config = require'config.gh_nvim',
  }

  -- HTTP request client
  use {
    "rest-nvim/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    ft = {'http'},
    config = require'config.rest_nvim',
  }

  -- Debug Adapter Protocol
   use {
     "mfussenegger/nvim-dap",
     config = require'config.nvim_dap',
  }

  use {
    "rcarriga/nvim-dap-ui",
    config = require'config.nvim_dap_ui',
  }

  -- Kangaroo
  use {
    "ggandor/leap.nvim",
    config = require'config.leap_nvim',
  }

  -- Finish bootstrap
  if packer_bootstrap then
    require('packer').sync()
  end
end)
