{ config, pkgs, ... }:

{
  home.username = "halozra";
  home.homeDirectory = "/home/halozra";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    kitty
    tokyonight-gtk-theme
    fira-code
    papirus-nord
    fastfetch
  ];

 import = [
  ../modules/fastfetch.nix
  ../modules/fish.nix
  ../modules/kitty.nix
 ]






}


