# assign zsh configs directory
ZSHD="$HOME/.zsh.d"

# modular configs with order
. "$ZSHD/functions"
. "$ZSHD/prompt"
. "$ZSHD/hooks"
. "$ZSHD/keybindings"

# modular configs without order
. "$ZSHD/terminfo"
. "$ZSHD/completions"
. "$ZSHD/options"
. "$ZSHD/aliases"

# zsh-clipboard for system clipboard communication
. "$ZSHD/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh"
