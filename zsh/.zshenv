# configure history settings
export HISTSIZE="5000"
export SAVEHIST="10000"
export HISTFILE="$HOME/.zsh_history"
setopt extended_history
setopt hist_ignore_dups
setopt hist_find_no_dups

# configure low delay for vim mode change
export KEYTIMEOUT="1"

# declare important environmental variables
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export EDITOR="vim"
export TERMINAL="termite"
export R_PROFILE_USER="$HOME/.Rprofile"
export QT_QPA_PLATFORMTHEME="qt5ct"

# update PATH variable
typeset -U PATH path
path=("$path[@]" "$HOME/bin" "$HOME/.local/bin" "$HOME/.emacs.d/bin" "$(ruby -e 'puts Gem.user_dir')/bin")
export PATH
