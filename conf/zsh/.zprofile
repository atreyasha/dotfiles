# configure history settings
export HISTSIZE="5000"
export SAVEHIST="10000"
export HISTFILE="$HOME/.zsh_history"

# configure low delay for vim mode change
export KEYTIMEOUT="1"

# conditional variable for gpg's ssh-agent emulation
# source: https://wiki.archlinux.org/title/GnuPG#SSH_agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ] && command -v gpgconf &>/dev/null; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# conditional variable for dircolors
if [ -f "$HOME/.dircolors" ]; then
  eval "$(dircolors -b "$HOME/.dircolors")"
fi

# conditional variable for R
if [ -f "$HOME/.Rprofile" ]; then
  export R_PROFILE_USER="$HOME/.Rprofile"
fi

# declare miscellaneous variables
export EDITOR="vim"
export TERMINAL="alacritty"
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"

# update PATH variable
typeset -U PATH path
path=("$path[@]" "$HOME/bin" "$HOME/.local/bin")
if command -v ruby &>/dev/null; then
  path=("$path[@]" "$(ruby -e 'puts Gem.user_dir')/bin")
fi
export PATH
