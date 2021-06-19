# bash command-history parameters
export HISTSIZE="5000"
export HISTFILESIZE="10000"
export HISTFILE="$HOME/.bash_history"
export HISTCONTROL="ignoredups"
export HISTTIMEFORMAT="%F %T: "

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
export PATH="$PATH:$HOME/bin:$HOME/.local/bin"
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# source .bashrc
. "$HOME/.bashrc"
