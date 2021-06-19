# if not running interactively, exit gracefully
[[ $- == *i* ]] || return

# assign bash configs directory
BASHD="$HOME/.bash.d"

# modular configs with order
. "$BASHD/functions"
. "$BASHD/keybindings"

# modular configs without order
. "$BASHD/terminfo"
. "$BASHD/prompt"
. "$BASHD/hooks"
. "$BASHD/completions"
. "$BASHD/options"
. "$BASHD/aliases"
