# Make sure to run this script from the root of the config repository
# The command should be exactly the following:
# bash scripts/setupLinux.sh
source "bash/exports.sh"

# Create directories if they don't exist
mkdir -P $HOME/.config/git
mkdir -P $HOME/.config/nvim
mkdir -P $HOME/.config/awesome
mkdir -P $HOME/.config/alacritty

# Link Bash profile
echo "source $CUSTOM_USER_CONFIG/bash/index.sh" > $HOME/.profile

# Link Git profile
printf "[include]\n    path = \"$CUSTOM_USER_CONFIG/git/indexLinux.gitconfig\"\n" > $HOME/.profile/git/config

# Link Neovim config
echo "source $CUSTOM_USER_CONFIG/vim/index.vim" > $HOME/.config/nvim/init.vim

# Link Awesome config
echo 'dofile(os.getenv("HOME") .. "/.damymetzke/awesome/index.lua")' > $HOME/.config/awesome/rc.lua

# Link Alacritty config
printf 'import:\n  - "~/.damymetzke/alacritty/index.yml"' > $HOME/.config/alacritty/alacritty.yml

