{ config, pkgs, ... }:
{
  # =========================================================================
  # GRAPHICS & GPU DRIVERS
  # =========================================================================
  # Pilih salah satu driver di bawah ini sesuai GPU yang kamu gunakan:
  
  # ---> AKTIF: Driver AMD Grafis
  services.xserver.videoDrivers = [ "amdgpu" ];
  
  # ---> NON-AKTIF: Driver Intel Modern (Hapus '#' di bawah jika ganti Intel)
  # services.xserver.videoDrivers = [ "modesetting" ];

  # Hardware Acceleration & Vulkan Support
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa
      vulkan-loader
      # intel-media-driver # Aktifkan ini jika menggunakan GPU Intel (VA-API)
    ];
  };

}