# Show current git branch in terminal
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  PS1='\[\e[0;95m\]╔══(\[\e[0;91m\]\u\[\e[0;1;31m\]@\[\e[0;91m\]\H\[\e[0;95m\])\[\e[0;95m\]═[\[\e[0;94m\]\w\[\e[0;95m\]]\[\e[0;95m\]═(\[\e[0;3;92m\]$(git symbolic-ref --short HEAD 2>/dev/null)\[\e[0;95m\])\n\[\e[0;95m\]╚ \[\e[0;1m\]\$ \[\e[0m\]'
else
  PS1='\[\e[0;95m\]╔══(\[\e[0;91m\]\u\[\e[0;1;31m\]@\[\e[0;95m\])\[\e[0;95m\]═[\[\e[0;94m\]\w\[\e[0;95m\]]\[\e[0;95m\]═(\[\e[0;3;92m\]$(git symbolic-ref --short HEAD 2>/dev/null)\[\e[0;95m\])\n\[\e[0;95m\]╚ \[\e[0;1m\]\$ \[\e[0m\]'
fi

# Let user know custom profile is loaded
printf "good $(part-of-day) Damy" | figlet -f "ANSI Shadow" -w 120 | xargs -0 -I {} printf '\033[0;36m%s\033[0m' "{}"

cd $(cat ~/.local/share/damymetzke/stored)

source /usr/share/nvm/init-nvm.sh
