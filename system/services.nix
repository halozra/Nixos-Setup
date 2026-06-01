{ config, pkgs, ... }:

{
  # Power management / stabilitas (auto-kill saat OOM)
  services.earlyoom.enable = true;

  # File system & USB storage support (Penting untuk File Manager/Nautilus)
  services.gvfs.enable = true;
  services.udisks2.enable = true;

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