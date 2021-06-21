DOTFILES = $$(ls -d */)
REMOTE_DOTFILES = alacritty bash dircolors git gnupg htop ranger readline tmux vim

.PHONY: install.monix
install.monix:
	stow -v -R -t ~ $(DOTFILES)

.PHONY: install.remote
install.remote:
	stow -v -R -t ~ $(REMOTE_DOTFILES)

.PHONY: uninstall
uninstall:
	stow -v -D -t ~ $(DOTFILES)
