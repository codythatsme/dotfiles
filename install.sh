#!/bin/bash
# Install dotfiles via GNU Stow.
# Idempotent: safe to re-run after pulling changes.

set -euo pipefail
DOTFILES="$HOME/Developer/dotfiles"
cd "$DOTFILES"

if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Running brew bundle..."
brew bundle --file="$DOTFILES/Brewfile"

# Drop stale symlinks from the pre-stow layout. Anything under $HOME pointing
# into $DOTFILES is ours and safe to remove; stow rebuilds what still applies.
find "$HOME" -maxdepth 4 -type l 2>/dev/null | while IFS= read -r link; do
  target="$(readlink "$link")"
  case "$target" in
    "$DOTFILES"/*|*Developer/dotfiles/*) rm "$link" ;;
  esac
done

echo "Stowing home/ -> ~..."
# --adopt absorbs any real file at a target into the package (replacing target
# with a symlink). Verify with `git status` afterward — anything imported that
# shouldn't be is a real divergence to inspect.
stow --target="$HOME" --restow --adopt home

"$DOTFILES/scripts/sync-mattpocock-skills.sh"

echo "Done."
