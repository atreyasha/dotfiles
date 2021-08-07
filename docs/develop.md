## Table of Contents
-   [Tasks](#tasks)
    -   [Next](#next)
    -   [Long-term](#long-term)

## Tasks

### Next

1.  **TODO** Shell/Bin

    1.  update `fold_stow` to use `main` function

        1.  improve parsing and management of variables

        2.  copy new `fold-stow` to `privates`

    2.  add more extensive formatting with usage to all bin scripts

        1.  not all should have `set -e` though, for example not
            `pre-sleep-hook`

        2.  make scripts more idiomatic and easier to understand with
            upstream source links for motivation

        3.  so there would be no need to keep looking up documentation
            later on -\> try to do this for all configurations in
            `monix` and `dotfiles`

    3.  make `bash_profile` PATH declaration unique -\> necessary for
        cases with tmux and new login shells:
        <https://unix.stackexchange.com/questions/40749/remove-duplicate-path-entries-with-awk-command>

        1.  add source to script as well

    4.  `killall` only works for one user:
        <https://superuser.com/questions/137207/how-to-kill-a-process-started-with-a-different-user-without-being-root-or-sudoer>

        1.  add this to script with source

2.  **TODO** i3

    1.  centralize how `xset` is executed and reverted such that all
        configurations are in one place

        1.  this would require changes to `i3lock-blur-lock` and perhaps
            renaming it to `i3lock-blur`

        2.  perhaps can have default floating around as environmental
            variable, or elsewhere

    2.  consider using lower i3blocks signals for logic

        1.  parse them with `sed` in `bin` scripts for refreshing

    3.  port `i3-cycle` backend to `i3ipc` and ship everything to
        AUR/pypi: <https://github.com/mota/i3-cycle/issues/3>

        1.  replace `pypi` package(s) with this implementation

    4.  `xss-lock` is not ideal since it gets triggered by DPMS and
        screensaver events which cannot be internally disabled:
        <https://wiki.archlinux.org/title/Power_management#Sleep_hooks>

### Long-term

1.  Monitor configuration

    1.  create `AUR` repository for alternative package management:
        <https://github.com/phillipberndt/autorandr/issues/250>

    2.  replace `pypi` package with this implementation

2.  Neovim

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

3.  Emacs

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

4.  Neomutt

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

5.  Test cases

    1.  test for force-folded directories -\> can re-use existing
        `fold_stow` script

    2.  test whether symlinks are already created or not as yet -\> this
        is missing from current tests

    3.  can be used for both `dotfiles` and `privates` and can be done
        after basic `stow` test

6.  Sync

    1.  implement `sync` in case repository tests fail

        1.  `adopt` files via stow and perform a git status check

        2.  force fold directory where file gets overwritten -\> eg.
            gtk2/3, qt5ct etc.

7.  Backup

    1.  clean up local drive

    2.  figure out how to preserve/return appropriate permission when
        syncing back and forth

        1.  might need to alter mount options for drive

    3.  try reformatting hard drive and encrypting

        1.  this would require a different workflow and back-up scripts
            would need to be changed

    4.  consider purchasing a yubikey to manage GPG keys

8.  PGP keys

    1.  host public key on `keys.openpgp.org` or `keybase.io`

    2.  add personal website page for accessing keys manually on GitHub
        or via specific keyserver (and mention not others)

    3.  consider adding PGP key-id to GitHub page

9.  Mimeapps/mailcap

    1.  add mailcap helpers in `conf` and coordinate with mimetypes

    2.  synchronize mime system program defaults to same as ranger\'s
        rifle

10. Qutebrowser

    1.  disable dpms/dim when video is playing: see bug report
        <https://github.com/qutebrowser/qutebrowser/issues/5504>

11. GitHub

    1.  consider usefulness of RS-repositories

        1.  perhaps knowledge can be synthesized into a single
            repository with shape files and dates on which they apply

        2.  this could also be in the form of a new data set for
            Himalayan forest cover reflectances

        3.  think of how to host RS thesis and if this even makes sense

    2.  consider purging SAM\'s 2 (1 deleted and 1 present) LFS files
        and replace with linked data

        1.  SAM\'s LFS data will be more problematic since an existing
            DOI and release is already created

        2.  need to test that no LFS data gets consumed with mock clones

12. Generic management

    1.  best way to force-fold would be to stow all with `--no-folding`
        and then re-do with `fold_stow`

    2.  update script which does manual update checks on files which
        might require upstream updates -\> perhaps perform a diff
        framework to accept/reject upstream changes -\> eg. `spacemacs`
        latex layer modified files

        1.  update configuration files with upstream changes (or remove
            upstream templates and keep barebones configurations)

        2.  examples include spacemacs `init.el`, qutebrowser
            `config.py`, ranger `scope.sh` and `rifle.conf` and picom
            `picom.conf`
