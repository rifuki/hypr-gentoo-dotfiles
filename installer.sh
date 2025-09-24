#!/bin/bash
# Dotfiles installer

DOTFILES="$HOME/.dotfiles/hypr-gentoo-dotfiles"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

configs=("hypr" "nvim" "spaceship" "tmux" "waybar" "wofi")
scripts=("screenshot-area-copy" "screenshot-area-save" "screenshot-copy" "screenshot-full")

echo "Installing dotfiles..."

###  BACKUP ###
echo "Backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR/config" "$BACKUP_DIR/local/bin" "$BACKUP_DIR/home" "$BACKUP_DIR/profile.d"
# Backup existing configs
for config in "${configs[@]}"; do
    [ -d ~/.config/$config ] && mv ~/.config/$config "$BACKUP_DIR/config/"
done
# Backup existing local/bin
for script in "${scripts[@]}"; do
    [ -f ~/.local/bin/$script ] && mv ~/.local/bin/$script "$BACKUP_DIR/local/bin/"
done
# Backup home files
[ -f ~/.zshrc ] && mv ~/.zshrc "$BACKUP_DIR/home/"
# Backup existing .profile.d files
if [ -d ~/.profile.d ]; then
    for profile in ~/.profile.d/*; do
        [ -f "$profile" ] && mv "$profile" "$BACKUP_DIR/profile.d/"
    done
fi

### Symlinks ###
# Create symlinks configs
mkdir -p ~/.config
for config in "${configs[@]}"; do
    [ -d "$DOTFILES/config/$config" ] && ln -sf "$DOTFILES/config/$config" ~/.config/$config
done
# Create symlinks local/bin
mkdir -p ~/.local/bin
for script in "${scripts[@]}"; do
    [ -f "$DOTFILES/local/bin/$script" ] && ln -sf "$DOTFILES/local/bin/$script" ~/.local/bin/$script
done
# Link home files
[ -f "$DOTFILES/zsh/.zshrc" ] && ln -sf "$DOTFILES/zsh/.zshrc" ~/.zshrc
# Link .profile.d files
mkdir -p ~/.profile.d
if [ -d "$DOTFILES/profile.d" ]; then
    for profile in "$DOTFILES/profile.d"/*; do
        [ -f "$profile" ] && ln -sf "$profile" ~/.profile.d/$(basename "$profile")
    done
fi

echo "Done! Backup created at: $BACKUP_DIR"
