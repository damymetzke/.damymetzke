# Show current git branch in terminal
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  PS1='\[\e[0;95m\]╔══(\[\e[0;91m\]\u\[\e[0;1;31m\]@\[\e[0;91m\]\H\[\e[0;95m\])\[\e[0;95m\]═[\[\e[0;94m\]\w\[\e[0;95m\]]\[\e[0;95m\]═(\[\e[0;3;92m\]$(git symbolic-ref --short HEAD 2>/dev/null)\[\e[0;95m\])\n\[\e[0;95m\]╚ \[\e[0;1m\]\$ \[\e[0m\]'
else
  PS1='\[\e[0;95m\]╔══(\[\e[0;91m\]\u\[\e[0;1;31m\]@\[\e[0;95m\])\[\e[0;95m\]═[\[\e[0;94m\]\w\[\e[0;95m\]]\[\e[0;95m\]═(\[\e[0;3;92m\]$(git symbolic-ref --short HEAD 2>/dev/null)\[\e[0;95m\])\n\[\e[0;95m\]╚ \[\e[0;1m\]\$ \[\e[0m\]'
fi

# Let user know custom profile is loaded
printf "\e[0;4;96mDamy Metzke\e[0m custom profile loaded!\n\n"

cd $(cat ~/.local/share/damymetzke/stored)
