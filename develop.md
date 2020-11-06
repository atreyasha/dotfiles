## Table of Contents
-   [Tasks](#tasks)
    -   [Dotfiles](#dotfiles)
    -   [System reproducibility](#system-reproducibility)
-   [Completed](#completed)
    -   [Dotfiles](#dotfiles-1)

Tasks
-----

### Dotfiles

1.  **TODO** bash/zsh fix reduced hard-coding to particular
    servers -\> add if statements to check for certain commands to
    reduce hard-coding -\> check for ranger and neomutt and other
    commands before setting up code/functions in shellrc\'s -\> same for
    environments such as cuda etc.

2.  **TODO** improve quality and formatting of all code,
    especially for bash/zsh/i3 and other shell scripts

3.  fix i3 issue with terminal nohups -\> not sure what this should be

4.  consider changing lock before suspend to systemd target, check if
    this helps

5.  move all special files elsewhere and add jack file as well -\> move
    special scripts to bin instead of in i3 folder

6.  find ways to reduce hard-coding of configs/dotfiles to
    \`/home/shankar\` or \`\~\` -\> perhaps this could be an additional
    script before stow -\> perhaps with some makefile configuration or
    sed replacement

7.  with time, try to also reduce the number of dotfiles for a leaner
    installation

8.  zsh improved configuration with display of virtual environment if
    necessary

9.  keep gnupg, ssh, neomutt and other directories in a private stow
    repo

### System reproducibility

1.  **TODO** extract all steps listed in i3 config file for
    reproducibility

2.  work on install script which setps up all the necessary git repos
    for dotfiles that cannot be managed with submodules -\> eg. vim,
    spacemacs etc.

3.  work on update script which updates all submodules to latest
    upstream commits (git submodule update --init --recursive --remote),
    and also updates misc. code bases such as melpa, vim, etc.

4.  work on script which returns arch linux OS state to current state
    using package list backups, dotfile installation scheme and notes
    for important steps taken from experience -\> test this with virtual
    machine -\> perhaps each update backs up package list as well

Completed
---------

### Dotfiles

1.  **DONE** change layout names to more agnostic -\> make
    this better

2.  **DONE** change background name to simpler one and
    synchronize throughout all references

3.  **DONE** replace simple git repos with submodules -\>
    only done for non-offensive git repos

4.  **DONE** Design non-offending stow command for all -\>
    put this in readme

5.  **DONE** Dotfile initiative started
