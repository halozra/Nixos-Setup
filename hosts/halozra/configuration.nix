
{ pkgs, ... }:

{
  imports = [
    # Desktop Environment
    ../../modules/desktop/gnome.nix

    # Hardware
    ./hardware-configuration.nix

    # System modules
    ../../modules/system/common.nix
    ../../modules/system/graphics.nix
    ../../modules/system/audio.nix
    ../../modules/system/network.nix
    ../../modules/system/services.nix
    ../../modules/system/gaming.nix
    ../../modules/system/virtualization.nix
    ../../modules/system/nix-settings.nix
    ../../modules/system/kernel.nix

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
    hashedPassword = "$6$KJs7SY/zbQ63dr5p$fczoIHq9lXpzshaznNWmrLwYyLxoojZsQOxC.nHw3O0uqUmxrtx1INrYCkcCG.0nnJjyTnVtQO3UILS1TrcOj0";
  };

  system.stateVersion = "26.05";
}
