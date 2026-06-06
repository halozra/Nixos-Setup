{ pkgs, ... }:

{
  imports = [
    ../../system/hardware-configuration.nix
    ../../system/common.nix
    ../../apps/systemApps.nix
    ../../desktop/kde.nix
    ../../system/graphics.nix
    ../../system/audio.nix
    ../../system/network.nix
    
    # Hasil pecahan baru kita:
    ../../system/services.nix
    ../../system/gaming.nix
    ../../system/virtualization.nix
    ../../system/nix-settings.nix
    ../../system/kernel.nix
  ];

  # User & Security
  users.users.halozra = {
    isNormalUser = true;
    group = "halozra";
    description = "halozra";
    home = "/home/halozra";
    extraGroups = [ "networkmanager" "wheel" "vboxusers" ]; # Tambah vboxusers jika pakai VirtualBox
  };
  users.groups.halozra = {};

  users.users.root = {
    hashedPassword = "$6$KJs7SY/zbQ63dr5p$fczoIHq9lXpzshaznNWmrLwYyLxoojZsQOxC.nHw3O0uqUmxrtx1INrYCkcCG.0nnJjyTnVtQO3UILS1TrcOj0";
  };

  system.stateVersion = "26.05";
}