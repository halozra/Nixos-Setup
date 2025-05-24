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
    (nerdfonts.override {
    fonts = [ "FiraCode" "JetBrainsMono" ];
  })
  ];

  # Import eksternal modules
  imports = [
    ../modules/fastfetch.nix
    ../modules/fish.nix
    ../modules/kitty.nix
  ];
}
