#!/bin/bash
set -e
DOTFILES="$HOME/Developer/dotfiles"

echo "Installing dotfiles..."

# Backup and symlink shell config
[ -f ~/.zshrc ] && [ ! -L ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.backup
ln -sf "$DOTFILES/zshrc" ~/.zshrc

# Backup and symlink git config
[ -f ~/.gitconfig ] && [ ! -L ~/.gitconfig ] && mv ~/.gitconfig ~/.gitconfig.backup
ln -sf "$DOTFILES/gitconfig" ~/.gitconfig

# Symlink .config directories
mkdir -p ~/.config
ln -sf "$DOTFILES/config/gh" ~/.config/gh
ln -sf "$DOTFILES/config/git" ~/.config/git

# Symlink Claude global skills
mkdir -p ~/.claude
[ -d ~/.claude/skills ] && [ ! -L ~/.claude/skills ] && mv ~/.claude/skills ~/.claude/skills.backup
ln -sf "$DOTFILES/claude/skills" ~/.claude/skills

echo "Done! Backups created with .backup extension if files existed."
