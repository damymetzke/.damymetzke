# Make sure to run this script from the root of the config repository
# The command should be exactly the following:
# bash scripts/setupLinux.sh
source "bash/exports.sh"

# Create directories if they don't exist
mkdir -p "$HOME/.config/awesome"

# Link Bash profile
echo "source $CUSTOM_USER_CONFIG/bash/index.sh" > $HOME/.profile

# Link Git profile
printf "[include]\n    path = \"$CUSTOM_USER_CONFIG/git/indexLinux.gitconfig\"\n" > $HOME/.gitconfig

# Link Neovim config
ln -s "$CUSTOM_USER_CONFIG/nvim" "$HOME/.config/nvim"

# Link Awesome config
printf 'package.path = os.getenv("HOME") .. "/.damymetzke/awesome/?.lua;" .. package.path\nrequire"index".run()' > $HOME/.config/awesome/rc.lua

# Link Alacritty config
ln -s "$CUSTOM_USER_CONFIG/alacritty" "$HOME/.config/alacritty"

