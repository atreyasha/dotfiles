DOTFILES = $$(ls -d conf/*/ | xargs -I{} basename {})
REMOTE_DOTFILES = alacritty bash dircolors git gnupg htop ranger readline tmux vim

.PHONY: init
init:
	cp "./hooks/pre-commit" "./.git/hooks/"
	git submodule update --init --recursive

.PHONY: update
update:
	git submodule update --init --recursive --remote

.PHONY: install
install:
	bash hooks/fold_stow "stow -v -R" "conf" "$$HOME" "$(DOTFILES)"

.PHONY: install.remote
install.remote:
	bash hooks/fold_stow "stow -v -R" "conf" "$$HOME" "$(REMOTE_DOTFILES)"

.PHONY: uninstall
uninstall:
	stow -v -D -d conf -t $$HOME $(DOTFILES)
