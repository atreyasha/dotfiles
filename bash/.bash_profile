#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.profile ]] && . ~/.profile

export PATH="$PATH:$HOME/bin:$HOME/.local/bin"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export EDITOR="vim"
export R_PROFILE_USER=$HOME/.Rprofile
export QT_QPA_PLATFORMTHEME=qt5ct
# export QT_QPA_PLATFORMTHEME=gtk2
# set PATH so it includes user's private bin directories
export PATH="$PATH:$HOME/gams/gams27.2_linux_x64_64_sfx"
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
