{ config, pkgs, ... }:

{
  home.username = "halozra";
  home.homeDirectory = pkgs.lib.mkForce "/home/halozra";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
  hyprland
  hyprpaper
  wayland
  wayland-utils
  wlogout
  wofi
  hyprlock
  swaybg
  grim
  slurp
  dunst
  networkmanagerapplet
  gtk4
  fontconfig
  wget
  bluez
  xfce.thunar
  yazi
  mako
  libnotify
  imv
  waybar
  font-awesome
  btop
  eww
];


  # Import eksternal modules
  imports = [
    ../modules/shared-packages.nix
    ../modules/fastfetch.nix
    ../modules/fish.nix
    ../modules/kitty.nix
    # ../config/eww
  ];
  # modules.eww.enable = true;
}
