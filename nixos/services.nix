{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.firefox.enable = true;

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
