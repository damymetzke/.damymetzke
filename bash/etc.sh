# Show current git branch in terminal
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  export PS1="\[\033[91m\]\u\e[1m@\e[0;91m\h \[\033[94m\]\w\[\033[92m\] \$(git symbolic-ref --short HEAD 2>/dev/null)\[\033[00m\$ "
else
  export PS1="\[\033[91m\]\u\e[1m@\e[0m \[\033[94m\]\w\[\033[92m\] \$(git symbolic-ref --short HEAD 2>/dev/null)\[\033[00m\$ "
fi

# Let user know custom profile is loaded
printf "\033[0;4;96mDamy Metzke\033[0m custom profile loaded!\n\n"
