" Color scheme
colorscheme gruvbox

" Indentation
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Text wrapping
set nowrap

" Search higlight
set nohlsearch

" No annoying sounds
set noerrorbells

" Sign column
set signcolumn

" Line numbers
set nu
set rnu

" Scroll sooner
set scrolloff=6

" Backup and undo
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Spell checking
set spelllang=en_us

" Prettier
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_require_pragma = 0
autocmd BufWritePre *.php Prettier

" NERDTree
let NERDTreeShowHidden=1
