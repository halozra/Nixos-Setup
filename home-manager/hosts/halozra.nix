{ config, pkgs, ... }:

{
  home.username = "halozra";
  home.homeDirectory = "/home/halozra"; 
  home.stateVersion = "26.05";

  # =========================================================================
  # FIX SINKRONISASI ENVIRONMENT SYSTEMD & DBUS (UNTUK PORTAL & FILE PICKER)
  # =========================================================================
  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session.target" ];
    };
  };
  # =========================================================================

  # JALUR NINJA BARU: Cukup panggil modul di bawah ini, beres!
  imports = [
    # Aplikasi & Modul Dasar
    ../../apps/apps.nix
    ../modules/fastfetch.nix
    ../modules/fish.nix
    ../modules/kitty.nix
    ../modules/fonts.nix
    ../modules/themes.nix
    ../modules/dolphin.nix

    # # kalau mau pakai gnome aktifkan ini aja
    # ../modules/desktop-gnome.nix
    # # kalau mau pakai hyprland aktifkan ini aja
    # ../modules/desktop-hyprland.nix # <-- Tinggal buka comment ini kalau di PC mau pake Hyprland juga!
  ];
}