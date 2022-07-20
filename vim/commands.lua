function run_command_in_terminal(command)
  return function(options)
    -- TODO: Run this command fully in lua
    vim.api.nvim_command(
      ':bel split | execute "terminal" "'
      .. command
      .. ' '
      .. options.args
      .. '" | :startinsert')
  end
end

-- Wrapper for cargo cli.
vim.api.nvim_create_user_command(
  'Cargo',
    run_command_in_terminal("cargo"),
  {nargs="+"}
)

-- Wrapper for Laravel sail.
vim.api.nvim_create_user_command(
  'Sail',
    run_command_in_terminal("./vendor/bin/sail"),
  {nargs="*"}
)

-- Wrapper for Maven.
vim.api.nvim_create_user_command(
  'Mvn',
    run_command_in_terminal("mvn"),
  {nargs="*"}
)

-- Wrapper for Maven wrapper.
vim.api.nvim_create_user_command(
  'Mvnw',
    run_command_in_terminal("./mvnw"),
  {nargs="*"}
)

