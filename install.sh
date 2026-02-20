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
ln -sfn "$DOTFILES/config/gh" ~/.config/gh
ln -sfn "$DOTFILES/config/git" ~/.config/git

# Symlink SSH config
mkdir -p ~/.ssh
[ -f ~/.ssh/config ] && [ ! -L ~/.ssh/config ] && mv ~/.ssh/config ~/.ssh/config.backup
ln -sf "$DOTFILES/config/ssh/config" ~/.ssh/config

# Symlink Claude global skills
mkdir -p ~/.claude
[ -d ~/.claude/skills ] && [ ! -L ~/.claude/skills ] && mv ~/.claude/skills ~/.claude/skills.backup
ln -sfn "$DOTFILES/claude/skills" ~/.claude/skills

# Symlink Claude config files
[ -f ~/.claude/CLAUDE.md ] && [ ! -L ~/.claude/CLAUDE.md ] && mv ~/.claude/CLAUDE.md ~/.claude/CLAUDE.md.backup
ln -sf "$DOTFILES/claude/CLAUDE.md" ~/.claude/CLAUDE.md

[ -f ~/.claude/settings.json ] && [ ! -L ~/.claude/settings.json ] && mv ~/.claude/settings.json ~/.claude/settings.json.backup
ln -sf "$DOTFILES/claude/settings.json" ~/.claude/settings.json

# Symlink Zed config
mkdir -p ~/.config/zed
[ -f ~/.config/zed/settings.json ] && [ ! -L ~/.config/zed/settings.json ] && mv ~/.config/zed/settings.json ~/.config/zed/settings.json.backup
ln -sf "$DOTFILES/config/zed/settings.json" ~/.config/zed/settings.json
[ -f ~/.config/zed/keymap.json ] && [ ! -L ~/.config/zed/keymap.json ] && mv ~/.config/zed/keymap.json ~/.config/zed/keymap.json.backup
ln -sf "$DOTFILES/config/zed/keymap.json" ~/.config/zed/keymap.json

echo "Done! Backups created with .backup extension if files existed."
