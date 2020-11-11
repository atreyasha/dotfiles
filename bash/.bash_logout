# reload gpg agent in order to remove cached key(s)
if pgrep -x gpg-agent &>/dev/null; then
  gpg-connect-agent reloadagent /bye
fi
