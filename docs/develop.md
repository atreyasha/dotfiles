## Table of Contents
-   [Tasks](#tasks)
    -   [Long-term](#long-term)

## Tasks

### Long-term

1.  Bin

    1.  look into changing cursor colors on upgrade command -\> likely
        `spacemacs` issue

    2.  justify all non-trivial scripts

        1.  add upstream source with comments so future justifications
            are easy to find

        2.  look through configurations in both `monix` and `dotfiles`

    3.  consistency and idiomaticness

        1.  update `refresh-i3blocks-\*` scripts

            1.  use lower real-time signals in `i3blocks.conf`, eg. 1-3

            2.  replace all with single script containing parser and
                usage which can either read signal from conf or input
                manually

            3.  update `udev` and `acpi` rules for these changes

        2.  `.xinitrc` and `i3lock-blur-lock`

            1.  rename `i3lock-blur-lock` to `i3lock-blur` and change
                reference in `i3` config

            2.  add `xset` configurations in a global location which can
                be accessed by both scripts for synchronization

            3.  consider adding `xset` pre and post settings to
                `pre-sleep` service -\> not sure if this is worth it

        3.  if applicable with sufficient SLOC, add usage and parser to
            scripts and make them re-usable/inter-dependent

            1.  eg. combine `i3lock` and `pre-sleep-hook` into single
                script with different arguments given context

            2.  be mindful of global `set -e`, for example not in
                `pre-sleep-hook`

            3.  possible to delete `refresh-monitor` script and place
                command in `i3` config

2.  i3

    1.  port `i3-cycle` backend to `i3ipc` and ship everything to
        AUR/pypi: <https://github.com/mota/i3-cycle/issues/3>

        1.  replace `pypi` package(s) with this implementation

    2.  migrate to `i3status-rust`

        1.  use SIGUSR1 to force update of blocks

        2.  remove all other custom scripts and i3blocks-contrib
            submodule

        3.  figure out how to achieve similar level of control and
            customization

        4.  update dotfile tasks as well to remove i3blocks or migrate
            these as well

3.  Monitor configuration

    1.  create `AUR` repository for alternative package management:
        <https://github.com/phillipberndt/autorandr/issues/250>

        1.  replace `pypi` package with this implementation

4.  Neovim

    1.  Basic

        1.  migrate from vim to neovim to fix upstream issues related to
            `terminfo` and `alacritty`:
            <https://github.com/alacritty/alacritty/issues/919>

        2.  conditionally alias `nvim` to `vim` if it exists -\> update
            preferences in applications to either `nvim` or `vim`

        3.  conditional `xterm-256color` declaration inside `.vimrc` if
            `nvim` is not running

            1.  update variables referencing `xterm-256color` or `vim`
                in dotfiles if necessary

        4.  find good location to install `suda` plugin from `nvim` to
            overcome issue:
            <https://github.com/neovim/neovim/issues/12103>

    2.  Next

        1.  re-develop neovim configuration from the ground up by
            removing all unnecessary plugins

        2.  sort out a clean way of updating all plugins as necessary:
            <https://github.com/amix/vimrc/issues/637>

            1.  this is no longer be necessary since plugins are
                regularly updated upstream

5.  Emacs

    1.  Change emacs distribution

        1.  migrate to lightweight and lean personal emacs configuration
            which would be optimized with time such as with `doom` -\>
            might help circumvent many bugs encountered such as those
            with `latex` and `elpy` compatibilities

        2.  work on script which updates all emacs packages during
            system update

    2.  Patch `company-reftex`

        1.  think about improving workflow to handle spaces, make case
            unsensitive and parse bibliography codes better (eg.
            \"doran2017does\" from \"do\") in
            `company-reftex-citation-candidates`, for development add
            package (eg.
            `(company-reftex :location (recipe :fetcher github :repo "atreyasha/company-reftex"))`)
            in `dotspacemacs-additional-packages` and update packages,
            delete old package location

        2.  think about removing `(reftex-access-scan-info)` before
            `parse-all` since this seems to be redundant, but would need
            more in-depth knowledge to figure this out

    3.  Patch `helm-company`

        1.  fix wrong argument error on `helm-company` post command hook
            -\> linked to `helm-company` interaction with
            `company-post-command`: see
            <https://github.com/Sodel-the-Vociferous/helm-company/issues/21>
            -\> fix would require looking at `company-post-command` to
            understand what is failing

    4.  Patch `elpy`

        1.  issue of `elpy` hard-coded `company` backends -\> this
            should instead be soft-coded and easily updated from
            upstream

    5.  Spacemacs

        1.  Improve autocompletions of latex layer:
            <https://github.com/syl20bnr/spacemacs/issues/14134>

            1.  wrong order of company-completions -\> brute-force
                solution is to create new layer

            2.  lighter solution is to modify `company-backends`
                variable post-initialization -\> perhaps with advice
                over latex init function

        2.  Automatically merge upstream changes to latex layer which
            are coped/modified

6.  Neomutt

    1.  reformat binding and unbinding schemes for each account to be
        more modular, consistent, portable and to re-use variables where
        possible

        1.  maybe can use for-loop with command-mode to create this
            quickly

        2.  consider removing junk for shortening configs

        3.  think of how to make this work better and less repetitive

    2.  raise issue on similar keys being acculumated in help pages -\>
        specifically when `i` and `d` are suffixed on commands

    3.  consider adding check-stats or sync-mailbox command after moving
        or copying -\> to update all statistics -\> maybe raise issue/PR
        for `mw`

    4.  improve other formatting with extended lines given
        `named-mailbox`, and other optimizations with commands, see:
        <https://github.com/jindraj/dotfiles/tree/master/.neomutt>

        1.  consider integrating `notmuch` in the future

    5.  issue of repeated compose command after send:
        <https://github.com/neomutt/neomutt/issues/2091>

    6.  issue of specified subkey not being used:
        <https://github.com/neomutt/neomutt/issues/2980>

        1.  update exact subkey when this is fixed

7.  Tests and syncing

    1.  test for force-folded directories -\> can re-use existing
        `fold_stow` script

    2.  test whether symlinks are already created or not as yet -\> this
        is missing from current tests

    3.  can be used for both `dotfiles` and `privates` and can be done
        after basic `stow` test

    4.  implement `sync` in case repository tests fail

        1.  `adopt` files via stow and perform a git status check

    5.  adjust `system-upgrade` to possibly ignore backup stage when not
        necessary on new machine

        1.  or enable selectively only on primary machine and not on
            downstream ones

    6.  add a system test option as a script which tests all important
        repositories and performs git status

        1.  this would also improve quick tests and can be used in a
            modular fashion by `system-upgrade`

        2.  this might help ensure pip packages are checked

8.  Backup

    1.  clean up local drive and remove unnecessary content

    2.  add new feature where GPG keys are compared for diffs before
        backing up -\> if even possible

    3.  figure out how to preserve/return appropriate permission when
        syncing back and forth

        1.  might need to alter mount options for drive

    4.  try reformatting hard drive and encrypting

        1.  this would require a different workflow and back-up scripts
            would need to be changed

    5.  consider purchasing a yubikey to manage GPG keys

9.  PGP keys

    1.  host public key on `keys.openpgp.org` or `keybase.io`

    2.  add personal website page for accessing keys manually on GitHub
        or via specific keyserver (and mention not others)

    3.  consider adding PGP key-id to GitHub page

10. Mimeapps/mailcap

    1.  add mailcap helpers in `conf` and coordinate with mimetypes

    2.  synchronize mime system program defaults to same as ranger\'s
        rifle

11. Qutebrowser

    1.  disable dpms/dim when video is playing: see bug report
        <https://github.com/qutebrowser/qutebrowser/issues/5504>

12. GitHub

    1.  licenses

        1.  look into source-code licenses required for `dotfiles` -\>
            perhaps these need to be updated

        2.  no need to add GPLv3 license to `dotfiles` since this repo
            is considered an aggregate

            1.  `emacs~/~spacemacs` functions independently, so it is
                sufficient that `spacemacs-elpy` uses GPLv3

    2.  consider improving quality of all `memory-daemon` code

        1.  testing might be difficult

    3.  add testing to `git-hooks` scripts

13. Generic management

    1.  try to reduce hard-coding in workflows overall -\> if possible
        try to make things inferred

    2.  think about whether three repos should be set up in
        environmental variables instead of hard-coded

    3.  improve parsing of `fold-stow` in `dotfiles` and `privates`

        1.  improve parser by defining default commands to prevent wrong
            usage

        2.  provide CLI options to overwrite options

    4.  consider adding more dotfiles to forced stow category,
        especially those where files get actively overwritten -\> for
        example GTK

    5.  update script which does manual update checks on files which
        might require upstream updates -\> perhaps perform a diff
        framework to accept/reject upstream changes -\> eg. `spacemacs`
        latex layer modified files

        1.  update configuration files with upstream changes (or remove
            upstream templates and keep barebones configurations)

        2.  examples include spacemacs `init.el`, qutebrowser
            `config.py`, ranger `scope.sh` and `rifle.conf` and picom
            `picom.conf`
