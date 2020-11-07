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

1.  **TODO** fine tune installation script for user and root
    level dotfiles -\> think about whether user files belong in dotfiles

2.  find ways to reduce hard-coding of configs/dotfiles to
    \`/home/shankar\` or \`\~\` -\> perhaps with makefile

3.  consider using different configs for remote and local shells

4.  look into user level acpi, udev and systemd services -\> add these
    where possible after clearing logs

5.  bash/zsh fix reduced hard-coding to particular servers -\> add if
    statements to check for certain commands to reduce hard-coding

6.  reduce the number of dotfiles for a leaner installation

7.  keep gnupg, ssh, neomutt and other directories in private stow repo

### System reproducibility

1.  work on install script which setps up all the necessary git repos
    for dotfiles that cannot be managed with submodules -\> eg. vim,
    spacemacs etc.

2.  work on update script which updates all submodules and git repos to
    latest upstream commits (git submodule update --init --recursive
    --remote), and also updates misc. code bases such as melpa, vim,
    spacemacs, etc.

3.  work on script which returns arch linux OS state to current state
    using package list backups, dotfile installation scheme and notes
    for important steps taken from experience -\> test this with virtual
    machine -\> perhaps each update backs up package list as well

4.  make all audio channels muted at boot (now only main channel is
    muted)

5.  synchronize mime system program defaults to same as ranger\'s rifle

6.  figure out how to dump all package names and associated systemd
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

3.  SSH~AUTHSOCK~ environmental variable needs to be set in shellrc

4.  stow \~/.ssh/config with instructions for adding keys to ssh agent

gnupg

1.  install \`gnupg\`

2.  stow \~/.gnupg/gpg-agent to get relevant agent functionalities and
    cached keys, along with shell GPG~TTY~ environmental variable

ACPI audio jack

1.  install \`acpid\`

2.  copy \`audio~jack~\` to /etc/acpi/events

3.  run \`sudo sytemctl enable acpid.service\` and \`sudo sytemctl start
    acpid.service\`

pre-suspend i3lock workflow

1.  i3lock post-suspend requires sleep to prevent short real display

2.  copy suspend@.service to /etc/systemd/system

3.  run \`sudo systemctl enable suspend@\$USER.service\`, remember to
    replace \$USER with the actual user

early KMS

1.  add \`MODULES=(intel~agp~ i915)\` to /etc/mkinitcpio.conf

2.  run \`sudo mkinitcpio -P\`

timesync

1.  run \`sudo systemctl enable systemd-timesyncd.service\` in order to
    sync time

Completed
---------

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
