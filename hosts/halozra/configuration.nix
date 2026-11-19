
{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  imports = [
    # Desktop Environment
    ../../modules/desktop/kde.nix

    # Hardware
    ./hardware-configuration.nix

    # System modules
    ../../modules/system

    # System applications
    ../../apps/systemApps.nix
  ];

  # User & Security
  users.users.halozra = {
    isNormalUser = true;
    group = "halozra";
    description = "halozra";
    home = "/home/halozra";
    extraGroups = [
      "networkmanager"
      "wheel"
      "vboxusers"
    ];
  };

  users.groups.halozra = {};

  users.users.root = {
    
  };

  system.stateVersion = "26.05";
}
