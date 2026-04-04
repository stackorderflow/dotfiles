#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

# Files to symlink at $HOME
HOME_FILES=(
  .zshrc
  .zprofile
  .zshenv
  .profile
  .tcshrc
)

# Files to symlink at $HOME/.config (relative to .config/)
CONFIG_FILES=(
  btop/btop.conf
  tmux/tmux.conf
)

# Whole directories to symlink at $HOME/.config (relative to .config/)
CONFIG_DIRS=(
  nvim
)

link() {
  local src="$1"
  local dst="$2"

  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    mkdir -p "$BACKUP_DIR/$(dirname "${dst#$HOME/}")"
    mv "$dst" "$BACKUP_DIR/${dst#$HOME/}"
    echo "  backed up: $dst -> $BACKUP_DIR/${dst#$HOME/}"
  fi

  mkdir -p "$(dirname "$dst")"
  ln -sf "$src" "$dst"
  echo "  linked: $dst -> $src"
}

echo "Installing dotfiles from $DOTFILES_DIR"
echo ""

echo "Home files:"
for f in "${HOME_FILES[@]}"; do
  link "$DOTFILES_DIR/$f" "$HOME/$f"
done

echo ""
echo ".config files:"
for f in "${CONFIG_FILES[@]}"; do
  link "$DOTFILES_DIR/.config/$f" "$HOME/.config/$f"
done

echo ""
echo ".config dirs:"
for d in "${CONFIG_DIRS[@]}"; do
  link "$DOTFILES_DIR/.config/$d" "$HOME/.config/$d"
done

echo ""
echo "Done."
