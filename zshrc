export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
alias lg='lazygit'
alias c='cursor'
export PATH="$HOME/.local/bin:$PATH"

# fnm (Fast Node Manager)
eval "$(fnm env --use-on-cd)"
