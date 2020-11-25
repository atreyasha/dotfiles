# source modular configurations with specific order
[ -f "$HOME/.zsh.d/prompt"      ] && . "$HOME/.zsh.d/prompt"
[ -f "$HOME/.zsh.d/functions"   ] && . "$HOME/.zsh.d/functions"
[ -f "$HOME/.zsh.d/hooks"       ] && . "$HOME/.zsh.d/hooks"
[ -f "$HOME/.zsh.d/keybindings" ] && . "$HOME/.zsh.d/keybindings"

# source modular configurations with no specific order
[ -f "$HOME/.zsh.d/colors"      ] && . "$HOME/.zsh.d/colors"
[ -f "$HOME/.zsh.d/completions" ] && . "$HOME/.zsh.d/completions"
[ -f "$HOME/.zsh.d/options"     ] && . "$HOME/.zsh.d/options"
[ -f "$HOME/.zsh.d/aliases"     ] && . "$HOME/.zsh.d/aliases"

# source zsh-clipboard to be able to use system clipboard
[ -f "$HOME/.zsh.d/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh" ] && . "$HOME/.zsh.d/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh"
