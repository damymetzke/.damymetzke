alias ls='exa -F'
alias la='exa -aF'
alias ll='exa -lhaF'
alias llpeek='exa -lhaFL1 --tree ./*'
alias llpeeka='exa -lhaFL2 --tree'
alias llless='exa -lahF --color=always | less -R'
alias gini='git init'
alias g-start='node ~/.dotfiles/scripts/gitStartup.js'
alias g-pr='node ~/.dotfiles/scripts/gitPullRequest.js'
alias cl='clear'
alias cll='clear && exa -lhaF'
alias ':q'='exit 0'
alias codi='code-insiders'
alias sail='./vendor/bin/sail'
alias nv='nvim'
alias spawnT='NO_DEFAULT_SSH=1 alacritty &'
alias store='echo $(pwd) > ~/.local/share/damymetzke/stored'

gtspad() {
  pushd "$(spad-dir)"
}

# Automatically fix typos
eval "$(thefuck --alias)"

rep() {
  cd $(repo -otext path $@)
}

custom_venv_prompt() {
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  echo '\[\e[0;95m\]╔══(\[\e[0;91m\]\u\[\e[0;1;31m\]@\[\e[0;91m\]\H\[\e[0;95m\])\[\e[0;95m\]═[\[\e[0;94m\]\w\[\e[0;95m\]]\[\e[0;95m\]═(\[\e[0;3;92m\]$(git symbolic-ref --short HEAD 2>/dev/null)\[\e[0;95m\])\n╠══(\[\e[0;91m\]venv/spad\[\e[0;95m\])\n\[\e[0;95m\]╚ \[\e[0;1m\]\$ \[\e[0m\]'
else
  echo '\[\e[0;95m\]╔══(\[\e[0;91m\]\u\[\e[0;1;31m\]@\[\e[0;95m\])\[\e[0;95m\]═[\[\e[0;94m\]\w\[\e[0;95m\]]\[\e[0;95m\]═(\[\e[0;3;92m\]$(git symbolic-ref --short HEAD 2>/dev/null)\[\e[0;95m\])\n╠══(\[\e[0;91m\]venv/spad\[\e[0;95m\])\n\[\e[0;95m\]╚ \[\e[0;1m\]\$ \[\e[0m\]'
fi
}

# Enable local python virtual environment.
# I need to use this because by default it edits the prompt.
# That prompt is ugly, so I add it manually.
# alias venv="bash -cl '"'VIRTUAL_ENV_DISABLE_PROMPT=1 . $(spad-dir)/venv/bin/activate;_OLD_VIRTUAL_PS1="${PS1-}";PS1="$(custom_venv_prompt)"'"'"
alias venv="bash -c '. venv-start; bash -l'"
    

# laravel-create() {
#   curl -s "https://laravel.build/$1" | bash
# }
