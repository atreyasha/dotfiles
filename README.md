## dotfiles

This repository contains dotfiles for a laptop running Arch Linux. The applications include `i3-gaps`, `emacs`, `neomutt` and many more. Below is a screenshot of a sample workspace:

<p align="center">
<img src="screenshot.png" width="700">
</p>

### Initialization

After cloning this repository, pull all submodules by executing:

```shell
$ git submodule update --init --recursive
```

### Usage

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) for managing dotfiles and respective symbolic links.

To deploy all the dotfiles here, we need to provide `stow` with a list of all dotfile directories:

```shell
$ stow -v -R -t ~ $(ls -d */)
```

Alternatively, if only a subset of the dotfiles are desired, simply indicate the name of the dotfile directories:

```shell
$ stow -v -R -t ~ dotfile_1 dotfile_2 ...
```

### Development

Check out our development [log](develop.md) for details on upcoming developments.

<!--  LocalWords:  dotfiles img src png dotfile
 -->
