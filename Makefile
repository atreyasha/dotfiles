DOTFILES = $$(ls -d */)

.PHONY: install.monix
install.monix:
	stow -v -R -t ~ $(DOTFILES)

.PHONY: install.remote
install.remote:
	stow -v -R -t ~ alacritty bash dircolors git gnupg htop ranger readline tmux vim

.PHONY: uninstall
uninstall:
	stow -v -D -t ~ $(DOTFILES)
