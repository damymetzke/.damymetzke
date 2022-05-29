if [ -n "$TMUX" ]; then
  cd $(tmux display-message -p "#S" | xargs repo-name-from-tmux)
fi
