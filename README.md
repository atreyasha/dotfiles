# dotfiles

This repository contains dotfiles for a minimal Arch Linux build. The applications include `i3-gaps`, `emacs`, `neomutt` and many more. Below is a screenshot of a sample workspace:

<p align="center">
<img src="./docs/screenshot.png" width="700">
</p>

## Initialization

After cloning this repository, initialize a pre-commit hook and pull all submodules by executing:

```
$ make init
```

## Installation

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) for managing dotfiles and respective symbolic links.

To deploy all the dotfiles corresponding to the [`monix`](https://github.com/atreyasha/monix) build, execute:

```
$ make install
```

To deploy a minimal subset of dotfiles on a remote machine, execute:

```
$ make install.remote
```

Alternatively, if a custom subset of the dotfiles is desired; simply indicate the name(s) of the dotfile directories:

```
$ stow -v -R -d conf -t ~ <dotfile_1> <dotfile_2> ...
```

## Uninstallation

To remove all stowed `dotfiles`, execute:

```
$ make uninstall
```

## Development

Check out our development [log](./docs/develop.md) for details on upcoming developments.

<!--  LocalWords:  dotfiles img src png dotfile
 -->
