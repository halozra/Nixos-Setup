
{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  imports = [
    # Desktop Environment
    ../../modules/desktop/kde.nix

    # Hardware
    ./hardware-configuration.nix

    # System modules
    ../../modules/system/common.nix
    ../../modules/system/graphics.nix
    ../../modules/system/audio.nix
    ../../modules/system/network.nix
    ../../modules/system/services.nix
    ../../modules/system/gaming.nix
    ../../modules/system/nix-settings.nix
    ../../modules/system/kernel.nix
    # ../../modules/system/virtualization.nix

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
