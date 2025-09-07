{ config, pkgs, ... }:

{
  # Networking
  networking.networkmanager.enable = true;

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
  programs.firefox.enable = true;
  programs = {
  steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
};



  # Hapus ini karena tidak ada `hardware.graphics` di module standard
  # Jika kamu mau Vulkan support, gunakan `hardware.opengl.enable`
hardware.graphics.enable = true;
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

  # MongoDB CE Custom Service
  systemd.services.mongodb-ce = {
    description = "MongoDB Community Edition";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.mongodb-ce}/bin/mongod --dbpath /var/lib/mongodb";
      Restart = "always";
    };
    preStart = ''
      mkdir -p /var/lib/mongodb
      chown -R ${config.users.users.halozra.name} /var/lib/mongodb
    '';
  };
}