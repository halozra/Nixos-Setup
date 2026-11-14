{ pkgs, ... }:

{
  # Aktifkan Steam dengan firewall terbuka untuk fitur lokal
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraCompatPackages = [ pkgs.gamemode ];
  };

  # Feral GameMode untuk memaksa CPU ke mode Performance saat main game
  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        desiredgov = "performance";
      };
      gpu = {
        apply_gpu_clocks = "no";
      };
    };
  };
}