export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
alias lg='lazygit'
export PATH="$PATH:$HOME/.local/bin"

# fnm (Fast Node Manager)
eval "$(fnm env --use-on-cd)"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
