## Table of Contents
-   [Tasks](#tasks)
    -   [Dotfiles](#dotfiles)
    -   [System reproducibility](#system-reproducibility)
-   [Completed](#completed)

Tasks
-----

### Dotfiles

1.  Current

    1.  **TODO** bash/zsh fix reduced hard-coding -\> add if
        statements to check for certain commands to reduce hard-coding
        (eg. ranger and neomutt) -\> put aliases in dedicated files for
        both bash and zsh

    2.  **TODO** reduce redundant code in bash/zsh and clean
        workflows up -\> would require understanding each line

    3.  clean up `~/.spacemacs.d` and make it organized as per blogpost
        with various sections -\> use consistent naming practices

    4.  consider using different configs for remote and local shells -\>
        perhaps section them into core, personal etc.

    5.  make all audio channels muted at boot (now only main channel is
        muted)

    6.  hook to shfmt on all shell scripts including zsh

    7.  problems with xset dpms when waking from sleep -\> perhaps add
        sleep 1 and then wake dpms

2.  Long-term

    1.  use pam environment to cache passphrase for ssh and gpg keys

    2.  special shell-check to ensure all shell tildes are replaced with
        \$HOME

    3.  synchronize mime system program defaults to same as ranger\'s
        rifle

    4.  reduce the number of dotfiles for a leaner installation

    5.  consider running emacs as a service to have everything
        synchronized in one run

    6.  port gnupg, ssh, neomutt private dotfiles to private stow repo

### System reproducibility

1.  work on update script which updates all submodules and git repos to
    latest upstream commits (git submodule update --init --recursive
    --remote), and also updates misc. code bases such as melpa, vim,
    spacemacs, etc.

2.  work on install script which sets up all the necessary git repos for
    dotfiles that cannot be managed with submodules

Completed
---------

**DONE** add upstream vim as submodule and then simply source
it cleanly + check if somehow possible for spacemacs too (change to
.spacemacs.d) -\> consider removing env file

**DONE** add public ssh and gnupg dotfiles, find a way to
source additional file from ssh config

**DONE** remove multiple vimrcs and keep only my_configs.vim
for simplicity

**DONE** consider doing away with .profile if not necessary
-\> or make this leaner -\> lowercase all zshrc comments

**DONE** replace tilde with \$HOME for standardization in
shell scripts -\> \$HOME is safer as it can be quoted and because it
works generally anywhere in a string -\> also allows your code to be
more portable

**DONE** check if possible to flash open dpms when recovering
from suspend where lock resulted in dpms down

**DONE** standardize or make uniform colors among i3blocks
blocklets -\> check exact hexes

**DONE** find out i3 default working font and name it
properly

**DONE** find ways to reduce hard-coding of configs/dotfiles
to `/home/shankar` or `~`

**DONE** extract all steps listed in i3 config file for
reproducibility -\> store them neatly with explanations and commands

**DONE** move all special files elsewhere and add jack file
as well

**DONE** improve quality and formatting of all code,
especially for i3 configs

**DONE** change layout names to more agnostic -\> make this
better

**DONE** change background name to simpler one and
synchronize throughout all references

**DONE** replace simple git repos with submodules -\> only
done for non-offensive git repos

**DONE** Design non-offending stow command for all -\> put
this in readme

**DONE** Dotfile initiative started
