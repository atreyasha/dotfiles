# conditionally kill gpg-agent and clear console
if [ "$SHLVL" -le 1 ]; then
  # this segment only gets executed when logging
  # out of base login shell and not a child shell
  if [ -n "$SSH_CONNECTION" ]; then
    # if a ssh-connection is detected
    # then kill gpg-agent when logging out
    # NOTE: killall can only kill user owned processes:
    # https://superuser.com/questions/137207
    killall gpg-agent
  fi
  # clear the console for privacy reasons
  clear
fi
