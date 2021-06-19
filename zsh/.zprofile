# configure history settings
export HISTSIZE="5000"
export SAVEHIST="10000"
export HISTFILE="$HOME/.zsh_history"

# configure low delay for vim mode change
export KEYTIMEOUT="1"

# declare important environmental variables
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export EDITOR="vim"
export TERMINAL="alacritty"
export R_PROFILE_USER="$HOME/.Rprofile"
export QT_QPA_PLATFORMTHEME="qt5ct"

# update PATH variable
typeset -U PATH path
path=("$path[@]" "$HOME/bin" "$HOME/.local/bin" "$(ruby -e 'puts Gem.user_dir')/bin")
export PATH
