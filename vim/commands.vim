" Alias for Laravel sail.
" This will automatically split the window.
command! -nargs=* Sail :bel split | execute "terminal" "./vendor/bin/sail <args>" | :startinsert

" Runs "sail npm i" and "sail composer install".
" This will automatically split the window.
command! -nargs=0 SailUpdate split | execute "terminal" "printf 'Updating NPM:\\n-------------\\n' && sail npm i && printf 'Updating Composer\\n-----------------\\n' && sail composer install" | :startinsert

command! -nargs=0 LaravelFormatRoute execute "%norm ==" | execute "%s/\'/\"/g" | %norm 0f*f"r'f"r'f"r'f"r'f"r'f"r'f"r'f"r'

" Alias for cargo for rust
" This will automatically split the window.
" This will use a tty terminal, so full interaction is possible.
command! -nargs=* Cargo :bel split | execute "terminal" "cargo <args>" | :startinsert

" Run a command in a bash terminal.
" This will also load the user profile
command! -nargs=+ RunT :execute "term" 'NO_DEFAULT_SSH=0 bash -lic "<args>"' | :startinsert

