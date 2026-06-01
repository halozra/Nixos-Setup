{ config, pkgs, ... }:

{
  # =========================================================================
  # NETWORKING CONFIGURATION
  # =========================================================================
  
  # Aktifkan NetworkManager (Utama untuk Wi-Fi & LAN)
  networking.networkmanager.enable = true;

  # Nama Komputer kamu di dalam jaringan lokal
  networking.hostName = "nixos";

  # =========================================================================
  # FIREWALL SECURITY (Sangat Direkomendasikan)
  # =========================================================================
  networking.firewall = {
    enable = true;
    
    # Blokir semua port masuk secara default demi keamanan
    allowPing = true; # Izinkan komputer kamu di-ping (opsional)
    
    # Jika kelak kamu butuh buka port tertentu (misal buat web dev / sharing):
    # allowedTCPPorts = [ 80 443 8080 ];
    # allowedUDPPorts = [ ... ];
  };

  # =========================================================================
  # OPTIMASI DNS (Biar Browsing Lebih Cepat & Stabil)
  # =========================================================================
  # Menggunakan Cloudflare DNS (1.1.1.1) dan Google DNS (8.8.8.8) secara global
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
}