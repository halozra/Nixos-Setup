{ pkgs, ... }:

{
  # 1. Aktifkan KDE Plasma 6 Desktop Environment
  services.desktopManager.plasma6.enable = true;
  
  # 2. Aktifkan Ly Display Manager & Matikan Autologin
  services.displayManager.ly.enable = true;
  services.displayManager.autoLogin.enable = false;

  # 3. Keyboard Layout
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # 4. Fix Konflik Ly dengan TTY1
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # 5. PERBAIKAN: Paket tambahan KDE ditaruh di sini
  environment.systemPackages = with pkgs; [
    kdePackages.plasma-systemmonitor # Monitor sistem bawaan KDE yang cakep
  ];
}