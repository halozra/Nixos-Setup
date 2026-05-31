{ config, pkgs, ... }:

{
  # Networking
  networking.networkmanager.enable = true;

  services.udev.packages = [ pkgs.openrgb ];


  # Audio (gunakan PipeWire modern)
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.pulseaudio.enable = false; # sudah digantikan PipeWire

  # Power management / stabilitas
  services.earlyoom.enable = true; # auto-kill saat OOM

  # File system & USB support (GNOME/Hyprland tetap pakai ini)
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # GPU Driver
  services.xserver.videoDrivers = [ "amdgpu" ];

  # App: penting
  programs = {
  steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraCompatPackages = [ pkgs.gamemode ];
   };
  };
  programs.gamemode = {
    enable = true;

    # opsional: setting tambahan
    settings = {
      general = {
        desiredgov = "performance"; # pakai governor CPU performance
      };
      gpu = {
        apply_gpu_clocks = "no";
      };
    };
  };


  # Hapus ini karena tidak ada `hardware.graphics` di module standard
  # Jika kamu mau Vulkan support, gunakan `hardware.opengl.enable`
hardware.graphics.enable = true;
hardware.graphics.extraPackages = with pkgs; [
    mesa
    vulkan-loader
];

hardware.graphics.enable32Bit = true;


  # Nix Store cleanup
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Disable feature yang jarang dipakai
  programs.command-not-found.enable = false;

  services = {
    hardware.openrgb = {
      enable = true;
      motherboard = "amd";
      package = pkgs.openrgb-with-all-plugins;
    };
    # I have no idea what the second tag is supposed to be or if it matters
    udev.extraRules = ''
      SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1002", ATTRS{idProduct}=="744C", TAG+="uaccess", TAG+="Sapphire_Nitro+_Radeon_RX_7900_XTX_GPU" 
    '';
  };
  hardware = {
    i2c.enable = true;
  };

  users.groups.i2c.members = [ "void" ];








  # MongoDB CE Custom Service
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