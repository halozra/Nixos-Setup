{ config, pkgs, ... }:

{
  home.username = "halozra";
  home.homeDirectory = "/home/halozra"; 
  home.stateVersion = "26.05";

  # Aktifkan dconf dan gtk agar aplikasi membaca konfigurasi & tema GNOME dengan benar
  dconf.enable = true;

  home.packages = with pkgs; [
    gnome-tweaks
    gnomeExtensions.pop-shell
    gnomeExtensions.blur-my-shell
    gnomeExtensions.freon
    gnomeExtensions.gsconnect
    gnomeExtensions.system-monitor
    gnomeExtensions.appindicator
    gnomeExtensions.caffeine
    gnomeExtensions.user-themes
    gnomeExtensions.just-perfection
    gnomeExtensions.dash-to-dock
  ];

  # =========================================================================
  # FIX SINKRONISASI ENVIRONMENT SYSTEMD & DBUS (UNTUK PORTAL & FILE PICKER)
  # =========================================================================
  # Ini adalah cara standar dan aman di Home Manager untuk memastikan
  # semua environment terlempar ke systemd user session milik GNOME.
  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session.target" ];
    };
  };

  # Mengizinkan Home Manager mengimpor variabel lingkungan ke sesi D-Bus/Systemd saat login
  home.enableDebugInfo = false; # Opsional, biarkan default
  # =========================================================================

  # Import eksternal modules
  imports = [
    ../../apps/apps.nix
    ../modules/fastfetch.nix
    ../modules/fish.nix
    ../modules/kitty.nix
    ../modules/fonts.nix
    ../modules/themes.nix
  ];
}