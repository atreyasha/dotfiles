# source modular configurations with specific order
. "$HOME/.zsh.d/functions"
. "$HOME/.zsh.d/prompt"
. "$HOME/.zsh.d/hooks"
. "$HOME/.zsh.d/keybindings"

# source modular configurations with no specific order
. "$HOME/.zsh.d/terminfo"
. "$HOME/.zsh.d/completions"
. "$HOME/.zsh.d/options"
. "$HOME/.zsh.d/aliases"

# source zsh-clipboard to be able to use system clipboard
. "$HOME/.zsh.d/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh"
