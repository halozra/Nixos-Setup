{ config, pkgs, ... }:

{
  home.username = "halozra";
  home.homeDirectory = pkgs.lib.mkForce "/home/halozra";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    kitty
    tokyonight-gtk-theme
    fira-code
    papirus-nord
    fastfetch
    bibata-cursors
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.jetbrains-mono
  ];

  # Import eksternal modules
  imports = [
    ../modules/fastfetch.nix
    ../modules/fish.nix
    ../modules/kitty.nix
  ];
}
