local wrap_command = require'util/wrap_command'

-- These commands wrap around shell commands
wrap_command('Cargo', 'cargo')
wrap_command('Sail', './vendor/bin/sail')
wrap_command('Mvn', 'mvn')
wrap_command('Mvnw', './mvnw')
wrap_command('Work', 'work')
wrap_command('Repo', 'repo')

