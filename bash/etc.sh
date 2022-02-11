# Show current git branch in terminal
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  export PS1="\e[91m\u\e[1m@\e[0;91m\h \e[94m\w\e[92m \$(git symbolic-ref --short HEAD 2>/dev/null)\e[00m\$ "
else
  export PS1="\e[91m\u\e[1m@\e[0m \e[94m\w\e[92m \$(git symbolic-ref --short HEAD 2>/dev/null)\e[0m\$ "
fi

# Let user know custom profile is loaded
printf "\e[0;4;96mDamy Metzke\e[0m custom profile loaded!\n\n"
