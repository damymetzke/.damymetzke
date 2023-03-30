if [ ! -n "$TMUX" ]; then
  shopt -s globstar
  eval `ssh-agent -s -t 120m`
fi
