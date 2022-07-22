return function(mode, keys, command)
  vim.api.nvim_set_keymap(mode, keys, command, {noremap = true, silent = true})
end
