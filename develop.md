## Table of Contents
-   [Tasks](#tasks)
    -   [Dotfiles](#dotfiles)
    -   [System reproducibility](#system-reproducibility)
-   [Completed](#completed)

Tasks
-----

### Dotfiles

1.  Current

    1.  **TODO** fix spacemacs conflicts with auto-completion
        and elpy -\> also improve general company autocompletion flow
        and trigger it only on user request -\> need to understand
        keybindings better to make this work

    2.  **TODO** make all audio channels muted at boot (now
        only main channel is muted) -\> very complicated because of
        pulseaudio and alsa simultaneous actions

    3.  bash/zsh: reduce redundant code in bash/zsh and clean workflows
        up -\> would require understanding each line and then deleting
        unnecessary ones

2.  Long-term

    1.  pam

        1.  use pam environment to cache passphrase for ssh and gpg keys

    2.  emacs

        1.  emacs: clean up `~/.spacemacs.d` and make it organized as
            per blogpost with various sections -\> will take time and
            effort

        2.  consider running emacs as a service to have everything
            synchronized in one run

    3.  i3

        1.  think about using xautolock/xss-lock to circumvent some
            manual pid checking and possibly extra sleep:
            <https://github.com/i3/i3lock/issues/275>

        2.  problems with xset dpms when waking from sleep -\> perhaps
            add sleep 1 and then wake dpms

    4.  shell

        1.  consider using different configs for remote and local shells
            by sectioning into personal, core, etc

        2.  hook to shfmt on all shell scripts including zsh

        3.  special shell-check to ensure all shell tildes are replaced
            with \$HOME

    5.  mimeapps

        1.  synchronize mime system program defaults to same as
            ranger\'s rifle

    6.  system

        1.  make scripts determine active \$DISPLAY environmental
            variable instead of hard-coding -\> use for cases where
            necessary

    7.  general

        1.  port gnupg, ssh, neomutt private dotfiles to private stow
            repo

        2.  reduce the number of dotfiles for a leaner installation

### System reproducibility

1.  work on update script which updates all submodules and git repos to
    latest upstream commits eg.
    `git submodule update --init --recursive --remote`, and also updates
    misc. code bases such as melpa, vim, spacemacs, etc.

2.  work on install script which sets up all the necessary git repos for
    dotfiles that cannot be managed with submodules

Completed
---------

**DONE** add user flags to pgrep i3lock cases -\> improve
other shell scripts too

**CLOSED:** *\[2020-11-12 Thu 14:46\]*

**DONE** clear shell output when logging out -\> useful for
ssh connections, see debian template -\> useful to have to override
existing default which may be confusing -\> don\'t do this

**CLOSED:** *\[2020-11-12 Thu 13:17\]*

**DONE** streamline and unify the usage of xsel and xclip -\>
decided to keep both options as both come in handy

**CLOSED:** *\[2020-11-12 Thu 12:57\]*

**DONE** fix tmux portability and xclip copy issues -\>
reverted to keep xsel

**CLOSED:** *\[2020-11-12 Thu 02:31\]*

**DONE** sort out gpg-agent forgetting keys issue -\> most
likely arises from reloadagent command in shell logout scripts

**CLOSED:** *\[2020-11-12 Thu 01:26\]*

**DONE** gpg-agent dying randomly again -\> put GPG_TTY in
.zshenv and somewhere important for bash -\> add if statement for logout
gpg-agent

**CLOSED:** *\[2020-11-11 Wed 20:32\]*

**DONE** invest in a minimal tmux configuration file

**CLOSED:** *\[2020-11-11 Wed 19:48\]*

**DONE** bash/zsh: clean up aliases and add if statements to
check for certain commands to reduce hard-coding (eg. ranger and
neomutt)

**CLOSED:** *\[2020-11-11 Wed 19:09\]*

**DONE** add upstream vim as submodule and then simply source
it cleanly + check if somehow possible for spacemacs too (change to
.spacemacs.d) -\> consider removing env file

**CLOSED:** *\[2020-11-10 Tue 15:31\]*

**DONE** add public ssh and gnupg dotfiles, find a way to
source additional file from ssh config

**CLOSED:** *\[2020-11-10 Tue 13:27\]*

**DONE** remove multiple vimrcs and keep only my_configs.vim
for simplicity

**CLOSED:** *\[2020-11-10 Tue 03:52\]*

**DONE** consider doing away with .profile if not necessary
-\> or make this leaner -\> lowercase all zshrc comments

**CLOSED:** *\[2020-11-10 Tue 02:37\]*

**DONE** replace tilde with \$HOME for standardization in
shell scripts -\> \$HOME is safer as it can be quoted and because it
works generally anywhere in a string -\> also allows your code to be
more portable

**CLOSED:** *\[2020-11-09 Mon 17:16\]*

**DONE** check if possible to flash open dpms when recovering
from suspend where lock resulted in dpms down

**CLOSED:** *\[2020-11-09 Mon 01:40\]*

**DONE** standardize or make uniform colors among i3blocks
blocklets -\> check exact hexes

**CLOSED:** *\[2020-11-08 Sun 16:06\]*

**DONE** find out i3 default working font and name it
properly

**CLOSED:** *\[2020-11-08 Sun 15:44\]*

**DONE** find ways to reduce hard-coding of configs/dotfiles
to `/home/shankar` or `~`

**CLOSED:** *\[2020-11-08 Sun 02:22\]*

**DONE** extract all steps listed in i3 config file for
reproducibility -\> store them neatly with explanations and commands

**CLOSED:** *\[2020-11-07 Sat 19:19\]*

**DONE** move all special files elsewhere and add jack file
as well

**CLOSED:** *\[2020-11-07 Sat 15:01\]*

**DONE** improve quality and formatting of all code,
especially for i3 configs

**CLOSED:** *\[2020-11-07 Sat 14:47\]*

**DONE** change layout names to more agnostic -\> make this
better

**CLOSED:** *\[2020-11-05 Thu 13:53\]*

**DONE** change background name to simpler one and
synchronize throughout all references

**CLOSED:** *\[2020-11-05 Thu 13:18\]*

**DONE** replace simple git repos with submodules -\> only
done for non-offensive git repos

**CLOSED:** *\[2020-11-04 Wed 17:15\]*

**DONE** Design non-offending stow command for all -\> put
this in readme

**CLOSED:** *\[2020-11-04 Wed 16:14\]*

**DONE** Dotfile initiative started

**CLOSED:** *\[2020-11-04 Wed 16:14\]*
