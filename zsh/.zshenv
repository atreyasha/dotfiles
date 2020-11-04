export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export GPG_TTY="$(tty)"
export EDITOR="vim"
export TERMINAL="termite"
export R_PROFILE_USER=$HOME/.Rprofile
export QT_QPA_PLATFORMTHEME=qt5ct
# export QT_QPA_PLATFORMTHEME=gtk2
# set PATH so it includes user's private bin directories
# export PYTHONPATH="/home/shankar/.emacs.d/.cache/quelpa/build"
typeset -U PATH path
path=("$path[@]" "$HOME/bin" "$HOME/.local/bin" "$HOME/.emacs.d/bin" "$HOME/gams/gams27.2_linux_x64_64_sfx" "$(ruby -e 'puts Gem.user_dir')/bin")
export PATH
