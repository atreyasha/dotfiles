# kill gpg-agent when logging out
if [ "$SHLVL" -le 1 ]; then
  if [ -n "$SSH_CONNECTION" ]; then
    killall gpg-agent
  fi
  clear
fi
