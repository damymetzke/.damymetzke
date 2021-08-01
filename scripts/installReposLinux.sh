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
sudo apt install go

# Install git
cd $R_GEN/git
git checkout v2.32.0
make
make install

# Install gh
cd $R_GEN/gh
git checkout v1.13.1
make install

# Install neovim
cd $R_GEN/neovim
git checkout nightly
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

