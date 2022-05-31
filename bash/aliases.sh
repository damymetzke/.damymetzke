alias ls='exa -F'
alias la='exa -aF'
alias ll='exa -lhaF'
alias llless='exa -lahF --color=always | less -R'
alias gini='git init'
alias g-start='node ~/.dotfiles/scripts/gitStartup.js'
alias g-pr='node ~/.dotfiles/scripts/gitPullRequest.js'
alias cl='clear'
alias ':q'='exit 0'
alias codi='code-insiders'
alias sail='./vendor/bin/sail'
alias nv='nvim'
alias spawnT='NO_DEFAULT_SSH=1 alacritty &'
alias store='echo $(pwd) > ~/.local/share/damymetzke/stored'

rep() {
  cd $(repo path $@)
}

laravel-create() {
  curl -s "https://laravel.build/$1" | bash
}
