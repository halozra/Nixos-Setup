{ config, pkgs, ... }:

{
  imports = [
    ../../modules/hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/packages.nix
    ../../modules/services.nix
    ../../modules/packages-hyprland.nix
  ];

  # 🖼️ Display Manager (pakai SDDM)
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.displayManager.autoLogin = {
    enable = true;
    user = "halozra";
  };
  services.displayManager.defaultSession = "hyprland";

  # 🌈 Hyprland setup
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # 🔊 Sound dan Bluetooth
  hardware.pulseaudio.enable = false;  # disable PA karena pipewire lebih disarankan
  hardware.bluetooth.enable = true;

  # 🌐 Wayland session envs
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_SESSION_TYPE = "wayland";
    NIXOS_OZONE_WL = "1";
  };

  # 👤 User config
  users.users.halozra = {
    isNormalUser = true;
    description = "halozra";
    home = "/home/halozra";
    group = "halozra";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  users.groups.halozra = {};
  system.stateVersion = "25.05";
}
