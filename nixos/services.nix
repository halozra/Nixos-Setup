{ config, pkgs, ... }:

{
  #service system
  networking.networkmanager.enable = true;
  services.printing.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.earlyoom.enable = true; #kill app ,if system freeze
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  #Zram
  zramSwap.enable = true;
  zramSwap.memoryPercent = 25;

  # service app
  programs.firefox.enable = true;
  programs.steam.enable = true;

  hardware.graphics.enable = true;

  services.gvfs.enable = true; # akses USB/NTFS lebih halus di GNOME
  services.udisks2.enable = true; # auto-mounting disk




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
