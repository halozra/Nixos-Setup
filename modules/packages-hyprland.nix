{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    ##########################
    ## 🖥️ Hyprland & Wayland Setup
    ##########################
  polkit
  polkit_gnome
  bluez
  ];


}
