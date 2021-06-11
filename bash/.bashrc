# if not running interactively, exit gracefully
[[ $- == *i* ]] || return

# source modular configurations with specific order
. "$HOME/.bash.d/functions"
. "$HOME/.bash.d/keybindings"

# source modular configurations with no specific order
. "$HOME/.bash.d/terminfo"
. "$HOME/.bash.d/prompt"
. "$HOME/.bash.d/completions"
. "$HOME/.bash.d/options"
. "$HOME/.bash.d/aliases"
