" FZF (ctrl+p)
nnoremap <silent> <C-p> :FZF<CR>

" Leader <space> 
let mapleader = " "

" Toggle NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>

" Open a new Bash instance.
" Will also load user profile.
nnoremap <leader>b :term NO_DEFAULT_SSH=0 bash -l<CR>a

" Set and unset spell checking
nnoremap <leader>s :set nospell! nospell?<CR>

" Set spell check language
nnoremap <leader>S :setlocal spell spelllang=

" Split window
nnoremap <leader>k :aboveleft split<CR>
nnoremap <leader>j :botright split<CR>
nnoremap <leader>h :aboveleft vsplit<CR>
nnoremap <leader>l :botright vsplit<CR>

" Emmet
nnoremap <leader>m <C-y>,

" Unbind keys
nnoremap <Left> :echo "No! Don't use the arrow keys! Bad!"<CR>
nnoremap <Right> :echo "No! Don't use the arrow keys! Bad!"<CR>
nnoremap <Up> :echo "No! Don't use the arrow keys! Bad!"<CR>
nnoremap <Down> :echo "No! Don't use the arrow keys! Bad!"<CR>

vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>

inoremap <Left> <Esc>:echo "No! Don't use the arrow keys! Bad!"<CR>i
inoremap <Right> <Esc>:echo "No! Don't use the arrow keys! Bad!"<CR>i
inoremap <Up> <Esc>:echo "No! Don't use the arrow keys! Bad!"<CR>i
inoremap <Down> <Esc>:echo "No! Don't use the arrow keys! Bad!"<CR>i
