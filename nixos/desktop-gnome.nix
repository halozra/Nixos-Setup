{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "halozra";

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}
