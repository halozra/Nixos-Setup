{ config, pkgs, ... }:

{
  home.username = "halozra";
  home.homeDirectory = "/home/halozra"; 
  home.stateVersion = "26.05";

  # Tetap aktif agar aplikasi GTK di lingkungan KDE bisa membaca konfigurasi dengan benar
  dconf.enable = true;

  home.packages = with pkgs; [
    # Kamu bisa tambahkan tools spesifik KDE di sini jika dibutuhkan nanti,
    # misalnya: kdePackages.krohnkite (jika ingin tiling window seperti Pop Shell)
  ];

  # =========================================================================
  # FIX SINKRONISASI ENVIRONMENT SYSTEMD & DBUS
  # =========================================================================
  # Memastikan system tray dan environment variables terlempar dengan aman 
  # ke sesi grafis (Wayland/X11) milik KDE Plasma.
  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session.target" ];
    };
  };

  home.enableDebugInfo = false; 
  # =========================================================================

  # Import eksternal modules (Fish, Kitty, Fonts, dan Themes kamu tetap aman digunakan)
  imports = [
    ../../apps/apps.nix
    ../modules/fastfetch.nix
    ../modules/fish.nix
    ../modules/kitty.nix
    ../modules/fonts.nix
    ../modules/themes.nix
  ];
}