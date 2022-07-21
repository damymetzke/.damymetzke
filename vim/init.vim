let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

lua require'pack'
luafile $CUSTOM_USER_CONFIG/vim/treeSitter.lua
luafile $CUSTOM_USER_CONFIG/vim/trouble.lua
luafile $CUSTOM_USER_CONFIG/vim/todo.lua
luafile $CUSTOM_USER_CONFIG/vim/snippets.lua
luafile $CUSTOM_USER_CONFIG/vim/nvimCmp.lua
luafile $CUSTOM_USER_CONFIG/vim/settings.lua
luafile $CUSTOM_USER_CONFIG/vim/wslSettings.lua
luafile $CUSTOM_USER_CONFIG/vim/keybinds.lua
luafile $CUSTOM_USER_CONFIG/vim/litee.lua
luafile $CUSTOM_USER_CONFIG/vim/commands.lua
" luafile $CUSTOM_USER_CONFIG/vim/luaLine.lua
luafile $CUSTOM_USER_CONFIG/vim/language.lua
" luafile $CUSTOM_USER_CONFIG/vim/lsp.lua
