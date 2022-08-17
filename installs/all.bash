cd ~/.damymetzke/installs

rm -rf ~/tmp/local_installs
mkdir -p ~/tmp/local_installs

tmux new-session -d -s source-installs -n nvim-nightly "bash nvim-nightly.bash"
