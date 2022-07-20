" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  " Theme
  Plug 'gruvbox-community/gruvbox'
  " Better Syntax Support
  " Plug 'sheerun/vim-polyglot'
  
  " LSP = Language Server Protocol
  Plug 'neovim/nvim-lspconfig'

  " File Explorer
  Plug 'scrooloose/NERDTree'
  " Prettier
  Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html', 'php'] }

  " Fzf
  " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  " Plug 'junegunn/fzf.vim'

  " Telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " Lualine
  Plug 'nvim-lualine/lualine.nvim'
  " Emmet
  Plug 'mattn/emmet-vim'
  " Git Gutter
  Plug 'airblade/vim-gitgutter'
  " Vim Fugitive (git)
  Plug 'tpope/vim-fugitive'
  " To display current Git branch
  Plug 'itchyny/vim-gitbranch'
  " nvim-cmp
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  " LuaSnip
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'

  " Markdown Preview
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

  " Trouble
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'folke/trouble.nvim'

  " Todos
  Plug 'folke/todo-comments.nvim'

  " Tree Sitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Harpoon
  Plug 'ThePrimeagen/harpoon'

  " Java LSP
  Plug 'mfussenegger/nvim-jdtls'

  " GH.nvim
  Plug 'ldelossa/litee.nvim'
  Plug 'ldelossa/gh.nvim'

call plug#end()
