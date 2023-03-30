# if [ -n "$TMUX" ]; then
  # cd $(tmux display-message -p "#S" | xargs repo -otext tmux-path 2> /dev/null | awk '{ print $3 }')
# fi

eval "$(grass shell-insert bash)"
