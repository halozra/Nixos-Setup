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

  services.desktopManager.gnome.extraGSettingsOverrides = 
  ''
  [org.gnome.desktop.session]
  idle-delay=uint32 0

  [org.gnome.settings-daemon.plugins.power]
  sleep-inactive-ac-type='nothing'
  sleep-inactive-ac-timeout=0
'';

  # ✅ Timer systemd supaya auto sleep setelah 5 jam
  systemd.timers."auto-suspend" = {
    enable = true;
    description = "Suspend otomatis setelah 5 jam";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "5h";
      Unit = "auto-suspend.service";
    };
  };

  systemd.services."auto-suspend" = {
    description = "Suspend System";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "/run/current-system/sw/bin/systemctl suspend";
    };};
 



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
  boot.kernelPackages = pkgs.linuxPackages_latest;

}
