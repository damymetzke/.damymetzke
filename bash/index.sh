source $HOME/.damymetzke/bash/exports.sh
source $CUSTOM_USER_CONFIG/bash/path.sh

# include .bashrc if it exists
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
      source "$HOME/.bashrc"
    fi
fi

source $CUSTOM_USER_CONFIG/bash/aliases.sh
source $CUSTOM_USER_CONFIG/bash/autoSsh.sh
source $CUSTOM_USER_CONFIG/bash/etc.sh
source $CUSTOM_USER_CONFIG/bash/tmux.sh

