# nixos-config

🧊 My personal NixOS + Home Manager configuration using flakes.

This repository contains a modular and flake-based configuration for my NixOS system, including:

- System config (`modules/`)
- Home Manager config (`home-manager/`)
- Flake setup (`flake.nix`, `flake.lock`)

Tested on GNOME. Fully declarative setup with Nix flakes.

## Getting Started

Clone the repo:

```bash
git clone https://github.com/yourusername/nixos-config.git
cd nixos-config
sudo nixos-rebuild switch --flake .#your-hostname
```
