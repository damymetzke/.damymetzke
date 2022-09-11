echo "Installing Neovim nightly"

# Clone repository
git clone --depth=1 https://github.com/neovim/neovim.git ~/tmp/local_installs/neovim
cd ~/tmp/local_installs/neovim

# Checkout nightly

git checkout nightly

# Build 

make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

# Clean up

cd ..
rm neovim

