{ config, pkgs, ... }:

{
  # =========================================================================
  # NETWORKING & SYSTEM SERVICES
  # =========================================================================
  networking.networkmanager.enable = true;

  # Power management / stabilitas (auto-kill saat OOM)
  services.earlyoom.enable = true;

  # File system & USB storage support (Penting untuk GNOME/Hyprland)
  services.gvfs.enable = true;
  services.udisks2.enable = true;


  # =========================================================================
  # AUDIO (PipeWire Modern)
  # =========================================================================
  security.rtkit.enable = true;
  services.pulseaudio.enable = false; # Sudah digantikan oleh PipeWire

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


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


  # =========================================================================
  # GAMING & APPLICATIONS
  # =========================================================================
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraCompatPackages = [ pkgs.gamemode ];
  };

  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        desiredgov = "performance"; # Pakai governor CPU performance saat main game
      };
      gpu = {
        apply_gpu_clocks = "no";
      };
    };
  };

  # Matikan fitur pencarian command yang jarang dipakai (hemat resource rebuild)
  programs.command-not-found.enable = false;


  # =========================================================================
  # NIX STORE MANAGEMENT (Optimization & GC)
  # =========================================================================
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1d";
  };


  # =========================================================================
  # DATABASE SERVICES (Opsional)
  # =========================================================================
  # MONGODB CE SERVICE (Hapus '#' di bawah ini jika ingin digunakan)
  # -------------------------------------------------------------------------
  # systemd.services.mongodb-ce = {
  #   description = "MongoDB Community Edition";
  #   wantedBy = [ "multi-user.target" ];
  #   after = [ "network.target" ];
  #   serviceConfig = {
  #     ExecStart = "${pkgs.mongodb-ce}/bin/mongod --dbpath /var/lib/mongodb";
  #     Restart = "always";
  #   };
  #   preStart = ''
  #     mkdir -p /var/lib/mongodb
  #     chown -R ${config.users.users.halozra.name} /var/lib/mongodb
  #   '';
  # };
}