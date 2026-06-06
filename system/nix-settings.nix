{ pkgs, ... }:

{
  # Matikan fitur pencarian command yang jarang dipakai (menghemat space & waktu rebuild)
  programs.command-not-found.enable = false;

  nix.gc = {
      automatic = true;
      
      # 🌟 CARA 1: Pakai keyword resmi Systemd (Jalan setiap jam 00:00 tengah malam)
      dates = "daily"; 
      
      # 🌟 CARA 2: (Alternatif) Kalau mau dispesifikin jalannya setiap jam 23:00 malam:
      # dates = "23:00"; 

      # Hapus otomatis berkas yang usianya di atas 1 hari (karena kamu maunya harian)
      options = "--delete-older-than 1d"; 
    };

  # Mengoptimalkan penyimpanan dengan mendeteksi file duplikat (hard-linking)
  nix.settings.auto-optimise-store = true;
}