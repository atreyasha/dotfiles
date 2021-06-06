## Table of Contents
-   [Tasks](#tasks)
    -   [Dotfiles](#dotfiles)
    -   [Update sanity](#update-sanity)

## Tasks

### Dotfiles

1.  **TODO** Deployment

    1.  develop basic scripts to deploy `stow` on local and remote
        machines, eg. `local.sh` and `remote.sh`

2.  **TODO** Private

    1.  port pass, gnupg, ssh, neomutt private dotfiles to private stow
        repo

3.  Neovim

    1.  Basic

        1.  migrate to neovim to fix upstream issues related to
            `alacritty`

        2.  conditionally alias `nvim` to `vim` if it exists +
            conditional `xterm-256color` declaration if `nvim` is not
            running + updating variables in dotfiles if necessary

        3.  find good location to install `suda` plugin to overcome
            issue: <https://github.com/neovim/neovim/issues/12103>

    2.  Next

        1.  re-develop neovim configuration from the ground up by
            removing all unnecessary plugins

        2.  sort out a clean way of updating all plugins as necessary:
            <https://github.com/amix/vimrc/issues/637>

4.  Emacs

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

        1.  wrong order of company-completions -\> brute-force solution
            is to create new layer

        2.  lighter solution is to modify `company-backends` variable
            post-initialization -\> perhaps with advice over latex init
            function

    2.  Automatically merge upstream changes to latex layer which are
        coped/modified

6.  Monitor configuration

    1.  use `autorandr` for more automatic monitor configuration -\>
        modify current monitor workflows

    2.  install `autorandr` python script via `pip` in the meantime for
        functionality

    3.  or perhaps create AUR repository to do this directly:
        <https://github.com/phillipberndt/autorandr/issues/250>

7.  I3

    1.  port `i3-cycle` backend to `i3ipc` and ship everything to
        AUR/pypi: <https://github.com/mota/i3-cycle/issues/3>

    2.  think about using xautolock/xss-lock to circumvent some manual
        pid checking and possibly extra sleep:
        <https://github.com/i3/i3lock/issues/275>

8.  Mimeapps

    1.  synchronize mime system program defaults to same as ranger\'s
        rifle

9.  System(d)

    1.  disable dpms/dim when video is playing: see bug report
        <https://github.com/qutebrowser/qutebrowser/issues/5504>

### Update sanity

1.  update script which updates all submodules and git repos to latest
    upstream commits eg.
    `git submodule update --init --recursive --remote` and then pushes
    upstream

2.  update script which does manual update checks on files which might
    require upstream updates -\> perhaps perform a diff framework to
    accept/reject upstream changes

3.  update script for `emacs`, `vim` and `pip` packages

4.  update script for package lists on `arch` repo and pushes afterwards
