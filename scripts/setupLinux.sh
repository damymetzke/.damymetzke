# Make sure to run this script from the root of the config repository
# The command should be exactly the following:
# bash scripts/setupLinux.sh
source "bash/exports.sh"

# Link bash profile
echo "source $CUSTOM_USER_CONFIG/bash/index.sh" > $HOME/.profile

# Link git profile
printf "[include]\n    path = \"$CUSTOM_USER_CONFIG/git/indexLinux.gitconfig\"\n" > $HOME/.gitconfig

# Link neovim config
echo "source $CUSTOM_USER_CONFIG/vim/index.vim" > $HOME/.config/nvim/init.vim
