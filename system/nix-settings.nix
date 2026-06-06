{ pkgs, ... }:

{
  # Matikan fitur pencarian command yang jarang dipakai (menghemat space & waktu rebuild)
  programs.command-not-found.enable = false;

  # Optimasi Nix Store & Jadwal Bersih-bersih otomatis seminggu sekali
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1d";
  };
{ config, pkgs, ... }:

{
  # ... konfigurasi username, homeDirectory, dan imports kamu ...

  # =========================================================================
  # SET DOLPHIN SEBAGAI FILE MANAGER DEFAULT (BAIK DI GNOME MAUPUN HYPRLAND)
  # =========================================================================
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Memaksa sistem membuka folder menggunakan Dolphin, bukan Nautilus (GNOME)
      "inode/directory" = [ "org.kde.dolphin.desktop" ];
    };
  };
  
  # Opsional: Memaksa menimpa file mimeapps.list lama agar tidak konflik
  xdg.configFile."mimeapps.list".force = true; 
}
}