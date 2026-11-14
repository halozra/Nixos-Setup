{ pkgs, ... }:

{
  # Aktifkan GNOME & Ly Display Manager
  services.desktopManager.gnome.enable = true;
  services.displayManager.ly.enable = true;
  services.displayManager.autoLogin.enable = false;

  # Keyboard Layout
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Fix konflik Ly dengan TTY1
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # GNOME Tweaks (No Sleep via GSettings)
  services.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.desktop.session]
    idle-delay=uint32 0

    [org.gnome.settings-daemon.plugins.power]
    sleep-inactive-ac-type='nothing'
    sleep-inactive-ac-timeout=0
  '';
}