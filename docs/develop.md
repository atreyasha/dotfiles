## Table of Contents
-   [Tasks](#tasks)
    -   [Next](#next)
    -   [Long-term](#long-term)

## Tasks

### Next

1.  **TODO** Consistency

    1.  all three repositories -\> `dotfiles`, `privates` and `monix`

        1.  add reminder in all readmes to clone in `$HOME` directory
            (this is hard-coded)

        2.  add weblink to repo in usage script for `system-upgrade` as
            well for clarity

        3.  ensure that all tildes are replaced with `$HOME`, as much as
            possible

        4.  ensure all `$USER` are replaced with `$HOME` to avoid
            hard-coding

        5.  replace `sh` with `bash` where possible

        6.  add this as an extra test case, could be useful so one does
            not have to remember it always

2.  **TODO** Backup

    1.  Framework

        1.  perhaps use `rsync` with tarballs to ensure only relevant
            data is updated

        2.  clean external hard-drive and organize folders there

            1.  clean up local drive to make space as well

        3.  back-up `personal` directory, `gnupg` keys and neomutt email
            archives

            1.  think of any other important data to back up -\> inspect
                drive for templates

            2.  consider moving mail archives to `personal` for easier
                backups

            3.  consider printing key as final failsafe using `paperkey`

            4.  consider purchasing a yubikey to manage GPG keys

    2.  Scheduling

        1.  schedule backups with timer or via manual notes

        2.  think of script to backup and deploy

### Long-term

1.  Sync

    1.  implement `sync` in case repository tests fail

        1.  `adopt` files via stow and perform a git status check

        2.  force fold directory where file gets overwritten -\> eg.
            gtk2/3, qt5ct etc.

2.  i3

    1.  port `i3-cycle` backend to `i3ipc` and ship everything to
        AUR/pypi: <https://github.com/mota/i3-cycle/issues/3>

    2.  replace `pypi` package(s) with this implementation

    3.  think about using xautolock/xss-lock to circumvent some manual
        pid checking and possibly extra sleep:
        <https://github.com/i3/i3lock/issues/207>

3.  Monitor configuration

    1.  create `AUR` repository for alternative package management:
        <https://github.com/phillipberndt/autorandr/issues/250>

    2.  replace `pypi` package with this implementation

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

7.  PGP keys

    1.  host public key on `keys.openpgp.org` or `keybase.io`

    2.  add personal website page for accessing keys manually on GitHub
        or via specific keyserver (and mention not others)

    3.  consider adding PGP key-id to GitHub page

8.  Mimeapps/mailcap

    1.  add mailcap helpers in `conf` and coordinate with mimetypes

    2.  synchronize mime system program defaults to same as ranger\'s
        rifle

9.  Qutebrowser

    1.  disable dpms/dim when video is playing: see bug report
        <https://github.com/qutebrowser/qutebrowser/issues/5504>

10. Generic

    1.  best way to foce-fold would be to stow all with `--no-folding`
        and then re-do with `fold_stow`

    2.  update script which does manual update checks on files which
        might require upstream updates -\> perhaps perform a diff
        framework to accept/reject upstream changes -\> eg. `spacemacs`
        latex layer modified files

        1.  update configuration files with upstream changes (or remove
            upstream templates)

        2.  examples include spacemacs, qutebrowser and ranger
