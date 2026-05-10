#!/bin/bash
# Sync skills from https://github.com/mattpocock/skills into ~/.claude/skills.
# Reads dotfiles/claude/mattpocock-skills.txt as the allowlist.
# Idempotent: clones repo if missing, pulls if present, creates/refreshes symlinks.

set -e
DOTFILES="$HOME/Developer/dotfiles"
REPO_URL="https://github.com/mattpocock/skills.git"
REPO_DIR="$DOTFILES/external/mattpocock-skills"
SKILLS_DIR="$DOTFILES/claude/skills"
ALLOWLIST="$DOTFILES/claude/mattpocock-skills.txt"

if [ ! -f "$ALLOWLIST" ]; then
  echo "ERROR: allowlist not found at $ALLOWLIST" >&2
  exit 1
fi

mkdir -p "$DOTFILES/external"

if [ -d "$REPO_DIR/.git" ]; then
  echo "Updating $REPO_DIR..."
  git -C "$REPO_DIR" pull --ff-only
else
  echo "Cloning $REPO_URL into $REPO_DIR..."
  git clone --depth 1 "$REPO_URL" "$REPO_DIR"
fi

# Track which links we own so stale ones can be removed.
managed_names=()

while IFS= read -r raw; do
  line="${raw%%#*}"
  line="${line## }"
  line="${line%% }"
  [ -z "$line" ] && continue

  category="${line%%/*}"
  name="${line##*/}"
  src="$REPO_DIR/skills/$category/$name"
  link="$SKILLS_DIR/$name"

  if [ ! -d "$src" ]; then
    echo "WARN: $line not found at $src — skipping" >&2
    continue
  fi

  if [ -e "$link" ] && [ ! -L "$link" ]; then
    echo "WARN: $link exists and is not a symlink — skipping" >&2
    continue
  fi

  ln -sfn "../../external/mattpocock-skills/skills/$category/$name" "$link"
  echo "  linked $name -> $category/$name"
  managed_names+=("$name")
done < "$ALLOWLIST"

# Prune stale symlinks: any symlink in skills/ that points into the matt repo
# but isn't in the allowlist any more.
for entry in "$SKILLS_DIR"/*; do
  [ -L "$entry" ] || continue
  target="$(readlink "$entry")"
  case "$target" in
    *external/mattpocock-skills/*)
      base="$(basename "$entry")"
      keep=0
      for n in "${managed_names[@]}"; do
        [ "$n" = "$base" ] && keep=1 && break
      done
      if [ "$keep" -eq 0 ]; then
        echo "  removing stale link $base"
        rm "$entry"
      fi
      ;;
  esac
done

echo "Done."
