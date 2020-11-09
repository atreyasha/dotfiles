## Table of Contents
-   [Tasks](#tasks)
    -   [Dotfiles](#dotfiles)
    -   [System reproducibility](#system-reproducibility)
-   [System reproduction logs after basic Arch
    installation](#system-reproduction-logs-after-basic-arch-installation)
-   [Completed](#completed)

Tasks
-----

### Dotfiles

1.  Current

    1.  **TODO** replace all tab characters with 2 spaces for
        consistency -\> add this as a git hook

    2.  **TODO** try to replace \$HOME with tilde for
        standardization across files

    3.  **TODO** reduce redundant code in bash/zsh and clean
        workflows like dircolors up -\> clean out user-specific code
        such as vpns and put them in misc/alias files

    4.  **TODO** bash/zsh fix reduced hard-coding -\> add if
        statements to check for certain commands to reduce hard-coding

    5.  **TODO** find workflow for shfmt on all shell scripts
        including zsh -\> use this as a git hook and replace all tabs
        with 2 spaces for uniformity esp. in zsh script

    6.  consider using different configs for remote and local shells

    7.  synchronize mime system program defaults to same as ranger\'s
        rifle

    8.  make all audio channels muted at boot (now only main channel is
        muted)

2.  Long-term

    1.  reduce the number of dotfiles for a leaner installation

    2.  use pam environment to cache passphrase for ssh and gpg keys

    3.  keep gnupg, ssh, neomutt and other directories in private stow
        repo

### System reproducibility

1.  **TODO** root files need to be added via hard files,
    migrate them to separate system local repo which holds package lists
    and installation script to revert things back to current state, use
    gnu install for those commands, make simple root install script
    which uses directory structure for installs, migrate system
    reproducibility log to this repo

2.  work on install script which setps up all the necessary git repos
    for dotfiles that cannot be managed with submodules -\> eg. vim,
    spacemacs etc.

3.  work on update script which updates all submodules and git repos to
    latest upstream commits (git submodule update --init --recursive
    --remote), and also updates misc. code bases such as melpa, vim,
    spacemacs, etc.

4.  work on script which returns arch linux OS state to current state
    using package list backups, dotfile installation scheme and notes
    for important steps taken from experience -\> test this with virtual
    machine -\> perhaps each update backs up package list as well

5.  figure out how to dump all package names and associated systemd
    rules which need to be recreated

System reproduction logs after basic Arch installation
------------------------------------------------------

sudo

1.  install \`sudo\`

2.  add or uncomment the following \`%wheel ALL=(ALL) ALL\` to allow for
    wheel users to access sudo

3.  use \`visudo\` to prevent any syntax errors

tlp runner

1.  instal \`tlp\`

2.  copy existing tlp.conf to /etc/tlp.conf for disabling bluetooth,
    wifi and wwan at startup

3.  run \`sudo systemctl enable tlp.service\` and \`sudo systemctl start
    tlp.service\`

light

1.  install \`light\` for managing backlight

2.  add local user to \`video\` group by running \`usermod -a -G video
    shankar\`

mesa video driver

1.  install \`mesa\` package and avoid \`xf86-video-intel\`

udev battery rules

1.  copy 60-onbattery.rules and 61-onpower.rules to /etc/udev/rules.d

2.  reload rules \`sudo udevadm control --reload\`

ufw firewall

1.  install \`ufw\`

2.  retain default settings that deny incoming requests while allowing
    outgoing

3.  run \`sudo systemctl enable ufw.service\` and \`sudo systemctl start
    ufw.service\`

4.  run \`sudo ufw enable\` to enable it outside systemd

openssh

1.  install \`openssh\`

2.  run \`systemctl --user enable ssh-agent.service\` and \`systemctl
    --user start ssh-agent.service\` on local file

3.  \`SSH~AUTHSOCK~\` environmental variable needs to be set in shellrc

4.  stow \~/.ssh/config with instructions for adding keys to ssh agent

gnupg

1.  install \`gnupg\`

2.  stow \~/.gnupg/gpg-agent to get relevant agent functionalities and
    cached keys, along with shell \`GPG~TTY~\` environmental variable

ACPI audio jack

1.  install \`acpid\`

2.  copy \`audio~jack~\` to /etc/acpi/events

3.  run \`sudo sytemctl enable acpid.service\` and \`sudo sytemctl start
    acpid.service\`

i3-cycle

1.  run \`pip install --user i3-cycle\`

2.  move raw python script to \~/bin because installed script gets
    slowed down due to path regexes

pre-suspend i3lock workflow

1.  all i3lock scripts have \`sleep 0.1\` to prevent i3 mode red color
    from being captured in screenshot

2.  i3lock post-suspend requires \`sleep 1\` to prevent short real
    display

3.  i3lock uses no forking \`-n\` for simple lock in order to modify
    dpms settings, otherwise it won\'t work

4.  i3lock was tested with concurrent lock and suspend, and there is a
    PID check to ensure no double i3locks are created

5.  \`xset -display :0 dpms force on\` to ensure screen lights up after
    suspend, in case it was locked and dimmed earlier

6.  copy pre-sleep@.service and post-sleep@.service to
    /etc/systemd/system

7.  run \`sudo systemctl enable (pre\|post)-sleep@\$USER.service\`,
    remember to replace \$USER with the actual user

8.  suspension after i3lock is delayed if less than or equal to 10
    seconds are left before dpms down -\> not sure about this but it is
    possible

early KMS

1.  add \`MODULES=(intel~agp~ i915)\` to /etc/mkinitcpio.conf

2.  run \`sudo mkinitcpio -P\`

timesync

1.  run \`sudo systemctl enable systemd-timesyncd.service\` in order to
    sync time

fonts

1.  install \`ttf-dejavu\`,\`ttf-font-awesome\`, \`otf-font-awesome\`
    and AUR \`nerd-fonts-bitstream-vera-mono\` for terminal font

2.  update cache using \`fc-cache -fv\`

3.  i3 uses fc-match to find best font which mostly ends up defaulting
    to \`DejaVu Sans\`, which is why it appears as a default

Completed
---------

**DONE** check if possible to flash open dpms when recovering
from suspend where lock resulted in dpms down

**DONE** standardize or make uniform colors among i3blocks
blocklets -\> check exact hexes

**DONE** find out i3 default working font and name it
properly

**DONE** find ways to reduce hard-coding of configs/dotfiles
to \`/home/shankar\` or \`\~\`

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
