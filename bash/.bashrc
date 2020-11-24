# if not running interactively, don't do anything
[[ $- == *i* ]] || return

# source modular configurations with specific order
[ -f "$HOME/.bash.d/colors"      ] && . "$HOME/.bash.d/colors"
[ -f "$HOME/.bash.d/prompt"      ] && . "$HOME/.bash.d/prompt"
[ -f "$HOME/.bash.d/functions"   ] && . "$HOME/.bash.d/functions"
[ -f "$HOME/.bash.d/keybindings" ] && . "$HOME/.bash.d/keybindings"

# source modular configurations with no specific order
[ -f "$HOME/.bash.d/completions" ] && . "$HOME/.bash.d/completions"
[ -f "$HOME/.bash.d/options"     ] && . "$HOME/.bash.d/options"
[ -f "$HOME/.bash.d/aliases"     ] && . "$HOME/.bash.d/aliases"
