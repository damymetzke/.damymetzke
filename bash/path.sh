# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Include snap and cargo
export PATH="$PATH:/snap/bin:/home/dmetzke/.cargo/bin:/home/dmetzke/go/bin"

# Include this bin directory
export PATH="$PATH:$CUSTOM_USER_CONFIG/bin"
