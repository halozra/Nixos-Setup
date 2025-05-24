{ config, pkgs, ... }:

{
  imports = [
    ../../modules/hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/packages.nix
    ../../modules/services.nix
    ../../modules/packages-gnome.nix
  ];

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "halozra";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  users.users.halozra = {
  isNormalUser = true;  # karena user biasa
  group = "halozra";    # grup utama user
  # opsional:
  description = "halozra";
  home = "/home/halozra";
  extraGroups = [ "networkmanager" "wheel" ];
  };

  users.groups.halozra = {};
  system.stateVersion = "24.11";
}
