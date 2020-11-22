# configure vim keybindings
bindkey -v

# configure history-related options
setopt extended_history
setopt hist_ignore_dups
setopt hist_find_no_dups

# configure completions (source: https://wiki.archlinux.org/index.php/zsh#Command_completion)
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
setopt complete_aliases

# configure dircolors
if [ ! -f "$HOME/.dircolors" ]; then
  eval "$(dircolors -b)"
else
  eval "$(dircolors -b "$HOME/.dircolors")"
fi

# function to return git branch information
function parse_git_branch {
  branch="$(git symbolic-ref --short HEAD 2> /dev/null)"
  [ -n "$branch" ] && echo " @$branch"
}

# define function for changing prompt depending on zsh vim mode (source and more: https://superuser.com/a/156204)
function zle-line-init zle-keymap-select {
  prefix="[%F{011}%B%n@%m%f%b:%F{blue}%B%~%b%f$(parse_git_branch)]"
  case ${KEYMAP} in
    (vicmd)
      PROMPT="$prefix%F{green}%#%f " ;;
    (*)
      PROMPT="$prefix%# " ;;
  esac
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# configure history search keybindings (source: https://wiki.archlinux.org/index.php/zsh#History_search)
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# configure extra keybindings directly from terminfo (source: https://wiki.archlinux.org/index.php/zsh#Key_bindings)
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
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-beginning-search
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-beginning-search
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[ShiftTab]}"  ]] && bindkey -- "${key[ShiftTab]}"  reverse-menu-complete

# finally, make sure the terminal is in application mode, when zle is active
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

# x-term-title (source: https://wiki.archlinux.org/index.php/zsh#xterm_title)
autoload -Uz add-zsh-hook
function xterm_title_precmd {
  print -Pn -- '\e]2;%n@%m: %~\a'
  [[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}
function xterm_title_preexec {
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
bindkey '^q' push-line-or-edit

# if ranger exists, create ranger-cd useful function and binding
if command -v ranger &>/dev/null; then
  # function for ranger-cd
  function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
      if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
      fi
    rm -f -- "$tempfile"
  }
  # configure keybindings for ranger-cd
  zle -N ranger-cd
  bindkey -s '^r' '^qranger-cd^m'
fi

# if neomutt exists, create binding
if command -v neomutt &>/dev/null; then
  bindkey -s '^n' '^qneomutt^m'
fi

# configure aliases
alias ls='ls --color=auto'
alias ll='ls -al'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias vpn_uzh='sudo openconnect --authgroup=ALL --background uzhvpn1.uzh.ch'
alias vpn_up='sudo openconnect --authgroup=sslvpn --background sslvpn.uni-potsdam.de'

# source zsh-clipboard to be able to use system clipboard
if [ -f "$HOME/.zsh/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh" ]; then
  . "$HOME/.zsh/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh"
fi
