let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

lua require'pack'
luafile $CUSTOM_USER_CONFIG/vim/settings.lua
luafile $CUSTOM_USER_CONFIG/vim/keybinds.lua
luafile $CUSTOM_USER_CONFIG/vim/commands.lua
luafile $CUSTOM_USER_CONFIG/vim/language.lua
