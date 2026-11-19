
{ config, pkgs, inputs, ... }:

{
  # ==========================================
  # USER CONFIGURATION
  # ==========================================

  home.username = "halozra";
  home.homeDirectory = "/home/halozra";

  # Jangan ubah stateVersion saat optimasi
  home.stateVersion = "26.05";


  # ==========================================
  # HOME MANAGER MODULES
  # ==========================================

  imports = [

    # Applications
    ../../apps/apps.nix

    # Terminal & Shell
    ../../modules/home-manager/modules/fish.nix
    ../../modules/home-manager/modules/kitty.nix

    # Appearance
    ../../modules/home-manager/modules/fonts.nix
    ../../modules/home-manager/modules/themes.nix

    # System Integration
    ../../modules/home-manager/modules/dolphin.nix
    ../../modules/home-manager/modules/fastfetch.nix

    # Desktop alternatives
    # ../../modules/desktop/desktop-gnome.nix
    # ../../modules/desktop/desktop-hyprland.nix

  ];


  # ==========================================
  # HOME MANAGER PROGRAMS
  # ==========================================

  programs.home-manager.enable = true;

}
