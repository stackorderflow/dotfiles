# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal macOS dotfiles managed with a symlink-based installer. No build system or test suite — changes take effect by re-running the installer or opening a new shell.

## Installing / applying changes

```sh
./install.sh
```

Creates symlinks from `$HOME` to each tracked file. Existing non-symlink files are backed up to `~/.dotfiles_backup/<timestamp>/` before being overwritten.

## Adding a new dotfile

1. Copy the file into the repo, preserving its path (e.g., `.config/foo/bar.conf`)
2. Add it to `HOME_FILES` (for `~/` files) or `CONFIG_FILES` (for `~/.config/` files) in `install.sh`
3. Run `./install.sh`

## File layout

- `HOME_FILES` in `install.sh` — symlinked directly under `$HOME` (`.zshrc`, `.zprofile`, `.zshenv`, `.profile`, `.tcshrc`)
- `CONFIG_FILES` in `install.sh` — symlinked under `$HOME/.config/` (currently `btop/btop.conf`)
- `.config/btop/btop.conf` — btop system monitor settings
