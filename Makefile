DOTFILES = $$(ls -d */)
REMOTE_DOTFILES = alacritty bash dircolors git gnupg htop ranger readline tmux vim

.PHONY: init
init:
	git submodule update --init --recursive

.PHONY: update
update:
	git submodule update --init --recursive --remote

.PHONY: install.monix
install.monix:
	stow -v -R -t ~ --no-folding $(DOTFILES)

.PHONY: install.remote
install.remote:
	stow -v -R -t ~ --no-folding $(REMOTE_DOTFILES)

.PHONY: uninstall
uninstall:
	stow -v -D -t ~ --no-folding $(DOTFILES)
