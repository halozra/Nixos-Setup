# nixos/desktop/desktop-hyprland.nix
{ config, pkgs, ... }:

{
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "hyprland";

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Optional: sound, wallpaper, notif, dll
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.bluetooth.enable = true;

  # Wayland envs (opsional tapi kadang penting)
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_SESSION_TYPE = "wayland";
    NIXOS_OZONE_WL = "1";
  };
}
