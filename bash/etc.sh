# Show current git branch in terminal
export PS1="\[\033[91m\]\u@\h \[\033[94m\]\w\[\033[92m\] \$(git symbolic-ref --short HEAD 2>/dev/null)\[\033[00m\$ "

# Let user know custom profile is loaded
printf "\033[0;4;96mDamy Metzke\033[0m custom profile loaded!\n\n"
