# bash command-history parameters
export HISTSIZE="5000"
export HISTFILESIZE="10000"
export HISTFILE="$HOME/.bash_history"
export HISTCONTROL="ignoredups"
export HISTTIMEFORMAT="%F %T: "

# conditional variable for gpg's ssh-agent emulation
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
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

# update PATH variable
export PATH="$PATH:$HOME/bin:$HOME/.local/bin"
if command -v ruby &>/dev/null; then
  export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
fi

# source .bashrc
. "$HOME/.bashrc"
