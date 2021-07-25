" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  " Theme
  Plug 'gruvbox-community/gruvbox'
  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'
  
  " LSP = Language Server Protocol
  Plug 'neovim/nvim-lspconfig'

  " File Explorer
  Plug 'scrooloose/NERDTree'
  " Auto pairs for '(' '[' '{'
  Plug 'jiangmiao/auto-pairs'
  " Prettier
  Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html', 'php'] }
  " Fzf
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Lightline
  Plug 'itchyny/lightline.vim'
  " Emmet
  Plug 'mattn/emmet-vim'
  " Git Gutter
  Plug 'airblade/vim-gitgutter'
  " Vim Fugitive (git)
  Plug 'tpope/vim-fugitive'
  "To display current Git branch
  Plug 'itchyny/vim-gitbranch'

call plug#end()
