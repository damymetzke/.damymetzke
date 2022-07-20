let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

source $CUSTOM_USER_CONFIG/vim/plugins.vim
luafile $CUSTOM_USER_CONFIG/vim/treeSitter.lua
luafile $CUSTOM_USER_CONFIG/vim/trouble.lua
luafile $CUSTOM_USER_CONFIG/vim/todo.lua
luafile $CUSTOM_USER_CONFIG/vim/snippets.lua
luafile $CUSTOM_USER_CONFIG/vim/nvimCmp.lua
luafile $CUSTOM_USER_CONFIG/vim/settings.lua
luafile $CUSTOM_USER_CONFIG/vim/wslSettings.lua
luafile $CUSTOM_USER_CONFIG/vim/keybinds.lua
luafile $CUSTOM_USER_CONFIG/vim/harpoon.lua
luafile $CUSTOM_USER_CONFIG/vim/litee.lua
luafile $CUSTOM_USER_CONFIG/vim/commands.lua
luafile $CUSTOM_USER_CONFIG/vim/luaLine.lua
source $CUSTOM_USER_CONFIG/vim/language.vim
luafile $CUSTOM_USER_CONFIG/vim/lsp.lua

source $CUSTOM_USER_CONFIG/vim/languages/index.vim
