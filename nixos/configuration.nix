{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./common.nix
      ./desktop/desktop-gnome.nix
      ./packages.nix
      ./services.nix
    ];

  networking.hostName = "nixos";
  networking.nameservers = [ "1.1.1.1" "1.0.0.1" ]; # Cloudflare

networking.firewall.allowedTCPPortRanges = [
  { from = 1714; to = 1764; }
];

networking.firewall.allowedUDPPortRanges = [
  { from = 1714; to = 1764; }
];



  users.users.halozra = {
    isNormalUser = true;
    description = "halozra";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  system.stateVersion = "24.11";
}
