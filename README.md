# dotfiles

Personal dotfiles for macOS. Managed with a simple symlink installer.

## What's included

| File | Description |
|------|-------------|
| `.zshrc` | Zsh config — PATH additions |
| `.zprofile` | Zsh login profile — Homebrew env setup |
| `.zshenv` | Zsh env — Cargo/Rust env |
| `.profile` | POSIX shell profile — Cargo/Rust env |
| `.tcshrc` | Tcsh config — Cargo/Rust env |
| `.config/btop/btop.conf` | [btop](https://github.com/aristocratos/btop) system monitor config |

## Install

```sh
git clone git@github.com:stackorderflow/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

The installer creates symlinks from `~` to each file in this repo. Any existing files that would be overwritten are backed up to `~/.dotfiles_backup/<timestamp>/` first.

## Adding new dotfiles

1. Copy the file into this repo (preserving its path structure)
2. Run `./install.sh` to symlink it
3. Add it to the `HOME_FILES` or `CONFIG_FILES` list in `install.sh`
