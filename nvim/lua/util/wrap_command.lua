return function(name, command)
  vim.api.nvim_create_user_command(
    name,
    function(options)
      -- TODO: Run this command fully in lua
      vim.api.nvim_command(
        ':bel split | execute "terminal" "'
        .. command
        .. ' '
        .. options.args
        .. '" | :startinsert')
    end,
    { nargs = "*" }
  )
end
