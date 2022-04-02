# bash command-history parameters
export HISTSIZE="5000"
export HISTFILESIZE="10000"
export HISTFILE="$HOME/.bash_history"
export HISTCONTROL="ignoredups"
export HISTTIMEFORMAT="%F %T: "

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

# define append_env_path function
# source: https://unix.stackexchange.com/a/282433
# purpose is to prevent $PATH duplicates
append_env_path() {
  case ":$PATH:" in
    *":$1:"*)
      true
      ;;
    *)
      PATH="$PATH:$1"
      ;;
  esac
}

# update PATH variable and export
append_env_path "$HOME/bin"
append_env_path "$HOME/.local/bin"
if command -v ruby &>/dev/null; then
  append_env_path "$(ruby -e 'puts Gem.user_dir')/bin"
fi
export PATH

# source .bashrc
. "$HOME/.bashrc"
