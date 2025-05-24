{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    ##########################
    ## 🖥️ Hyprland & Wayland Setup
    ##########################
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
    polkit
    wget
    bluez
    nnn
    xfce.thunar

  ];


}
