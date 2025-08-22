{ config, pkgs, ... }:

{
  imports = [
    ../../system/hardware-configuration.nix
    ../../system/common.nix
    ../../system/packages.nix
    ../../system/services.nix
  ];

  services.desktopManager.gnome.enable = true;

  # Pakai Ly sebagai Display Manager
  services.displayManager.ly.enable = true;


  # Nonaktifkan autoLogin karena Ly manual login
  services.displayManager.autoLogin.enable = false;


  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;


  users.users.halozra = {
    isNormalUser = true;
    group = "halozra";
    description = "halozra";
    home = "/home/halozra";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  users.groups.halozra = {};
  system.stateVersion = "25.05";
}
