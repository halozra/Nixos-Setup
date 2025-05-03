{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./common.nix
      ./desktop-gnome.nix
      ./packages.nix
      ./services.nix
    ];

  networking.hostName = "nixos";

  users.users.halozra = {
    isNormalUser = true;
    description = "halozra";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  system.stateVersion = "24.11";
}
