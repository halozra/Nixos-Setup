{ config, pkgs, ... }:

{
  home.username = "halozra";
  home.homeDirectory = pkgs.lib.mkForce "/home/halozra";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
  hyprland
  waybar
  wayland
  wayland-utils
  wlogout
  rofi-wayland-unwrapped
  hyprlock
  swaybg
  swww
  grim
  slurp
  dunst
  networkmanagerapplet
  gtk4
  fontconfig
  wget
  bluez
  nnn
  xfce.thunar
  mako
  libnotify
  imv
];


  # Import eksternal modules
  imports = [
    ../modules/shared-packages.nix
    ../modules/fastfetch.nix
    ../modules/fish.nix
    ../modules/kitty.nix
  ];
}
