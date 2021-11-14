alias la='ls -aF'
alias ll='ls -laF'
alias gini='git init'
alias g-start='node ~/.dotfiles/scripts/gitStartup.js'
alias g-pr='node ~/.dotfiles/scripts/gitPullRequest.js'
alias cl='clear'
alias ':q'='exit 0'
alias codi='code-insiders'
alias sail='./vendor/bin/sail'
alias nv='nvim'
alias spawnT='NO_DEFAULT_SSH=1 uxterm &'

laravel-create() {
  curl -s "https://laravel.build/$1" | bash
}
