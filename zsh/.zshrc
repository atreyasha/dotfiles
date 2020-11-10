# configure history settings
HISTFILE="$HOME/.histfile"
HISTSIZE=1000
SAVEHIST=1000

# configure vim keybindings
bindkey -v

# configure completions (source: https://wiki.archlinux.org/index.php/Zsh)
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
zstyle ':completion::complete:*' gain-privileges 1

# configure dircolors
if [ ! -f "$HOME/.dircolors" ]; then
  eval "$(dircolors -b)"
else
  eval "$(dircolors -b "$HOME/.dircolors")"
fi

# configure local aliases
alias vpn_uzh='sudo openconnect --authgroup=ALL --background uzhvpn1.uzh.ch'
alias vpn_up='sudo openconnect --authgroup=sslvpn --background sslvpn.uni-potsdam.de'
alias ls='ls --color=auto'
alias ll='ls -al'

# configure low delay for vim mode change
export KEYTIMEOUT=1

# function to return git branch information
parse_git_branch() {
  branch="$(git symbolic-ref --short HEAD 2> /dev/null)"
  [ -n "$branch" ] && echo " @$branch"
}

# define function for changing prompt depending on zsh vim mode
function zle-line-init zle-keymap-select {
  # define prompt prefix
  prefix="[%F{011}%B%n@%m%f%b:%F{blue}%B%~%b%f$(parse_git_branch)]"
  # start cases
  case ${KEYMAP} in
    (vicmd)
      PROMPT="$prefix%F{green}%#%f " ;;
    (*)
      PROMPT="$prefix%# " ;;
  esac
  zle reset-prompt
}

# initialize above functions for dynamic prompts
zle -N zle-line-init
zle -N zle-keymap-select

# configure extra keybindings (source: https://wiki.archlinux.org/index.php/Zsh)
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[ShiftTab]="${terminfo[kcbt]}"

# setup keys accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[ShiftTab]}"  ]] && bindkey -- "${key[ShiftTab]}"  reverse-menu-complete

# finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
  autoload -Uz add-zle-hook-widget
  function zle_application_mode_start {
    echoti smkx
  }
  function zle_application_mode_stop {
    echoti rmkx
  }
  add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
  add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# configure history search keybindings (source:ghttps://wiki.archlinux.org/index.php/Zsh)
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# x-term-title (source: https://wiki.archlinux.org/index.php/Zsh)
autoload -Uz add-zsh-hook
function xterm_title_precmd () {
  print -Pn -- '\e]2;%n@%m: %~\a'
  [[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}
function xterm_title_preexec () {
  print -Pn -- '\e]2;%n@%m: %~ %(!.#.$) ' && print -n -- "${(q)1}\a"
  [[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}
if [[ "$TERM" == (screen*|xterm*|rxvt*|tmux*|putty*|konsole*|gnome*) ]]; then
  add-zsh-hook -Uz precmd xterm_title_precmd
  add-zsh-hook -Uz preexec xterm_title_preexec
fi

# configure command-line edits in editor
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# function for ranger-cd
function ranger-cd() {
  tempfile="$(mktemp -t tmp.XXXXXX)"
  ranger --choosedir="$tempfile" "${@:-$(pwd)}"
  test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
      cd -- "$(cat "$tempfile")"
    fi
  rm -f -- "$tempfile"
}

# configure keybindings for ranger-cd and neomutt
zle -N ranger-cd
bindkey '^q' push-line-or-edit
bindkey -s '^r' '^qranger-cd^m'
bindkey -s '^n' '^qneomutt^m'

# source zsh-clipboard to be able to use system clipboard
source "$HOME/.zsh/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh"
