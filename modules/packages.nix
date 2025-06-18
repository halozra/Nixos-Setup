{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

environment.systemPackages = with pkgs; [
  mongodb-ce
  ntfs3g
  vulkan-tools
  vulkan-loader
  mesa
  vulkan-utility-libraries
  gnutls
  dconf
  glib-networking
  xdg-utils
  lm_sensors
  earlyoom
  driversi686Linux.mesa
  polkit
  polkit_gnome
];

}