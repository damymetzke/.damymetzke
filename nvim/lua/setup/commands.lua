local wrap_command = require'util/wrap_command'

-- These commands wrap around shell commands
wrap_command('Cargo', 'cargo')
wrap_command('Sail', './vendor/bin/sail')
wrap_command('Work', 'work')
wrap_command('Repo', 'repo')

wrap_command('Mvn', './mvnw')
wrap_command('Gradle', './gradlew')

-- Store current file contents in saved/*.js .
-- This is a temporary solution to a specific problem.
vim.api.nvim_create_user_command(
  "Save",
  function()
    vim.api.nvim_command(':!copy-to-saved js %')
  end,
  { nargs = 0 }
)

vim.api.nvim_create_user_command(
  "PyRun",
  function(opts)
    vim.api.nvim_command(string.format(':!python -c "exec(open(\'%%\').read()); %s()"', opts.fargs[1]))
  end,
  { nargs = 1 }
)
