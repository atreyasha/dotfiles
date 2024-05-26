DOTFILES = $$(find conf -mindepth 1 -maxdepth 1 -type d -not -path '*/\.*' -printf '%f\n')
REMOTE_DOTFILES = $$(printf '%s\n' alacritty bash dircolors git gnupg htop ranger readline tmux vim)

.PHONY: init
init:
	cp "./hooks/pre-commit" "./.git/hooks/"
	cp "./hooks/post-commit" "./.git/hooks/"
	git submodule update --init --recursive

.PHONY: update
update:
	git submodule update --init --recursive --remote

.PHONY: install
install:
	./hooks/fold-stow "stow -v -R" "conf" "$$HOME" "$(DOTFILES)"
	chmod 700 "$$HOME/.gnupg"

.PHONY: install.remote
install.remote:
	./hooks/fold-stow "stow -v -R" "conf" "$$HOME" "$(REMOTE_DOTFILES)"
	chmod 700 "$$HOME/.gnupg"

.PHONY: uninstall
uninstall:
	stow -v -D -d conf -t $$HOME $(DOTFILES)

.PHONY: test
test:
	stow -R -n --no-folding --ignore='^\.fold$$' -d conf -t $$HOME $(DOTFILES)
	! git grep -rI "$$USER" conf &>/dev/null
	! git grep -rI "$$HOME" conf &>/dev/null
	! git grep -rI "/bin/sh" conf &>/dev/null
	! git grep -rI "[^%]~[^%]" conf/zsh conf/bash conf/bin &> /dev/null
