# Make sure to run this script from the root of the config repository
# The command should be exactly the following:
# bash scripts/setupLinux.sh
source "bash/exports.sh"

mkdir -p $R_GEN
cd $R_GEN

# Clone repos
git clone https://github.com/git/git.git
git clone https://github.com/cli/cli.git ./gh
git clone https://github.com/neovim/neovim.git

# Install packages
sudo apt update
sudo apt install autoconf automake cmake curl dh-autoreconf g++ gettext golang libcurl4-gnutls-dev libexpat1-dev libssl-dev libtool libtool-bin libz-dev ninja-build pkg-config unzip yarn

# Install git
cd $R_GEN/git
git checkout v2.32.0
make
make install

# Install gh
cd $R_GEN/gh
git checkout v1.13.1
sudo make install

# Install neovim
cd $R_GEN/neovim
git checkout nightly
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
# Link "vi", "vim" and "nvim" to nvim executable
ln -s $R_GEN/neovim/build/bin/nvim $HOME/bin/vi
ln -s $R_GEN/neovim/build/bin/nvim $HOME/bin/vim
ln -s $R_GEN/neovim/build/bin/nvim $HOME/bin/nvim

