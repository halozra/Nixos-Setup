{ pkgs, ... }:

{
  # 1. Otomatisasi generate file config hyprpaper lewat Home Manager
  xdg.configFile."hypr/hyprpaper.conf" = {
    text = ''
      preload = /home/halozra/.config/halozra/wallpapers/c7b3d32dfb.jpg
      wallpaper = HDMI-A-1,/home/halozra/.config/halozra/wallpapers/c7b3d32dfb.jpg
    '';
    force = true;
  };

  # 2. Amankan seluruh ekosistem aplikasi pendukung Hyprland kamu
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
    thunar            # File manager andalan pas di Hyprland
    yazi              # File manager berbasis terminal yang super ngebut
    mako
    libnotify
    imv
    waybar
    font-awesome
    btop
    eww
    tumbler           # Generator thumbnail buat gambar di Thunar
  ];

  # modules.eww.enable = true; # Biarkan di-comment kalau belum matang
}