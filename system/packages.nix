{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

environment.systemPackages = with pkgs; [
  mongodb-ce
  ntfs3g
  vulkan-tools
  vulkan-utility-libraries
  vulkan-validation-layers

  gnutls
  dconf
  glib-networking
  xdg-utils
  lm_sensors
  earlyoom
  polkit
  polkit_gnome
  gamemode
  steam
  i2c-tools

];



}