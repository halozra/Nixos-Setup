{ pkgs, ... }:

{
  programs.command-not-found.enable = false;

  nix.gc = {
    automatic = true;
    dates = "daily";
    persistent = true;

    # Hapus generasi yang berusia lebih dari 1 hari
    options = "--delete-older-than 1d";
  };

  nix.settings.auto-optimise-store = true;
}