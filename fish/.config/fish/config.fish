eval "$(starship init fish)"
set SSH_AUTH_SOCK /tmp/ssh-XXXXXXfxf9XP/agent.35422

# Aliases
  # LS and LA
  alias ls "eza --icons"
  alias la "eza -a --icons"

  # Nixos rebuild
  alias ntfy-rebuild "sudo nixos-rebuild switch --flake /etc/nixos/#default && curl -d \"✅ Nix rebuild done\" ntfy.sh/NixOS_alerts || curl -d \"⚠️ Nix rebuild failed!\" ntfy.sh/NixOS_alerts"

  # Bat cat
  alias cat "bat --color=always"

# FZF Tab-complete
fzf_configure_bindings --directory=\t --variables=\e\cv
