# bash command-history parameters
export HISTSIZE="5000"
export HISTFILESIZE="10000"
export HISTFILE="$HOME/.bash_history"
export HISTCONTROL="ignoredups"
export HISTTIMEFORMAT="%F %T: "

# declare important environmental variables
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export EDITOR="vim"
export TERMINAL="termite"
export R_PROFILE_USER="$HOME/.Rprofile"
export QT_QPA_PLATFORMTHEME="qt5ct"
export PROMPT_COMMAND="history -a; history -c; history -r"

# update PATH variable
export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.emacs.d/bin"
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# source .bashrc
[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
