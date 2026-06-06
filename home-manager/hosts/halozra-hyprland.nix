{ config, pkgs, ... }:

{
  home.username = "halozra";
  home.homeDirectory = pkgs.lib.mkForce "/home/halozra";
  home.stateVersion = "26.05";
  xdg.configFile."hypr/hyprpaper.conf" = {
    text = ''
      preload = /home/halozra/.config/halozra/wallpapers/c7b3d32dfb.jpg
      wallpaper = HDMI-A-1,/home/halozra/.config/halozra/wallpapers/c7b3d32dfb.jpg
    '';
    force = true;
  };

  home.packages = with pkgs; [
  hyprland
  hyprpaper
  wayland
  wayland-utils
  wlogout
  rofi
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
  thunar
  yazi
  mako
  libnotify
  imv
  waybar
  font-awesome
  btop
  eww
  tumbler
];


  # Import eksternal modules
  imports = [
    ../../apps/apps.nix
    ../modules/fastfetch.nix
    ../modules/fish.nix
    ../modules/kitty.nix
    ../modules/fonts.nix
    ../modules/themes.nix

  ];
  # modules.eww.enable = true;
}
