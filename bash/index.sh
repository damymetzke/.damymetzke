source $HOME/.damymetzke/bash/exports.sh
source $CUSTOM_USER_CONFIG/bash/path.sh

# include local scripts if available
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$CUSTOM_USER_CONFIG/git/local/index.bash" ]; then
      source "$CUSTOM_USER_CONFIG/git/local/index.bash"
    fi
fi

source $CUSTOM_USER_CONFIG/bash/aliases.sh
source $CUSTOM_USER_CONFIG/bash/completions.sh
source $CUSTOM_USER_CONFIG/bash/autoSsh.sh
source $CUSTOM_USER_CONFIG/bash/etc.sh
source $CUSTOM_USER_CONFIG/bash/tmux.sh

