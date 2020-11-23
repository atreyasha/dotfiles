# if not running interactively, don't do anything
[[ $- == *i* ]] || return

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and possibly resize
shopt -s checkwinsize

# set terminal-specific prompt and color variables
case "$TERM" in
xterm-termite)
  color_prompt="yes"
  tic -x "$HOME/.config/termite/termite.terminfo"
  ;;
*)
  color_prompt="yes"
  ;;
esac

# create un-/colorized command-line prompt
if [ "$color_prompt" == "yes" ]; then
  PS1='\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='\u@\h:\w\$ '
fi
unset color_prompt

# configure dircolors
if [ ! -f "$HOME/.dircolors" ]; then
  eval "$(dircolors -b)"
else
  eval "$(dircolors -b "$HOME/.dircolors")"
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# autocompletions and history search
complete -cf sudo
complete -c man which
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# if ranger exists, create ranger-cd useful function and binding
if command -v ranger &>/dev/null; then
  # ranger-cd shortcut
  function ranger-cd() {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
      if [ "$(cat -- "$tempfile")" != "$(echo -n $(pwd))" ]; then
        cd -- "$(cat "$tempfile")"
      fi
    rm -f -- "$tempfile"
  }
  # bind Ctrl-r to ranger-cd
  bind '"\C-r":"ranger-cd\C-m"'
fi

# if neomutt exists, create binding
if command -v neomutt &>/dev/null; then
  bind '"\C-n":"neomutt\C-m"'
fi

# configure aliases
alias ls='ls --color=auto'
alias ll='ls -al'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
