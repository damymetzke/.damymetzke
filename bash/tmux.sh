if [ -n "$TMUX" ]; then
  cd $(tmux display-message -p "#S" | xargs repo tmux-path 2> /dev/null)
fi
