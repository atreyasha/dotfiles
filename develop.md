## Table of Contents
-   [Tasks](#tasks)
    -   [Dotfiles](#dotfiles)
    -   [System reproducibility](#system-reproducibility)
-   [Completed](#completed)
    -   [Dotfiles](#dotfiles-1)

Tasks
-----

### Dotfiles

1.  **TODO** fine-tune the leftover files by improving code
    quality

2.  zsh/bash/tmux improved configurations with display of virtual
    environment

3.  check for ranger and neomutt and other commands before setting up
    code/functions in shellrc\'s

4.  change background name to simpler one and synchronize throughout all
    references

### System reproducibility

1.  **TODO** extract all steps list in i3 config file for
    reproducibility

2.  work on install script which setps up all the necessary git repos
    for dotfiles that cannot be managed with submodules -\> eg. vim,
    spacemacs etc.

3.  work on update script which updates all submodules to latest
    upstream commits (git submodule update --init --recursive --remote),
    and also updates misc. code bases such as melpa, vim, etc.

4.  keep gnupg, ssh, neomutt and other directories in a private stow
    repo

Completed
---------

### Dotfiles

1.  **DONE** replace simple git repos with submodules -\>
    only done for non-offensive git repos

2.  **DONE** Design non-offending stow command for all -\>
    put this in readme

3.  **DONE** Dotfile initiative started
