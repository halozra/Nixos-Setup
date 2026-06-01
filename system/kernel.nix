{ pkgs, ... }:

{
  # =========================================================================
  # KERNEL CONFIGURATION & OPTIMIZATION
  # =========================================================================

  # Menggunakan kernel Linux versi terbaru stabil (Sangat bagus untuk hardware modern)
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Parameter Tambahan Kernel (Sysctl) untuk Optimasi Sistem
  boot.kernel.sysctl = {
    # 1. Mengurangi penggunaan SWAP (Biar RAM utama lebih diprioritaskan)
    "vm.swappiness" = 10;

    # 2. Menaikkan batas max file watch (Penting agar VS Code/Go-lang tidak kehabisan limits saat indexing project besar)
    "fs.inotify.max_user_watches" = 524288;

    # 3. Optimasi Network TTL (Pindahan dari common.nix kemarin)
    "net.ipv4.ip_default_ttl" = 64;
  };

  # Modul Kernel Tingkat Rendah yang otomatis dimuat saat booting
  boot.kernelModules = [ 
    "i2c-dev" 
    "i2c-piix4" # Untuk kontrol hardware / RGB / sensor lewat i2c-tools
  ];

  # Bersihkan layar bootloader dari text log sistem yang berantakan (Opsional - Mode Cantik)
  boot.consoleLogLevel = 3;
  boot.kernelParams = [ "quiet" "splash" ];
}