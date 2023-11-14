export R_ROOT="$HOME/repos"
export R_GEN="$R_ROOT/general"

export CUSTOM_USER_CONFIG="$HOME/.damymetzke"
export FZF_DEFAULT_COMMAND="find -L"
export WINIT_X11_SCALE_FACTOR=1

export EDITOR=nvim
export BROWSER="flatpak run com.brave.Browser"

# Poetry breaks on my system because it tries to use KDE Wallet.
# Even when I'm doing somthing that does not require a keyring
# I'm not using KDE wallet, and I'm not intending to just do add dependencies.
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring

# Standard directories
export XDG_PRIVATE_DIR="$HOME/repos/maintained/private-data"
