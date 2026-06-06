{
  imports = [
    ../../system/hardware-configuration.nix
    ../../system/common.nix
    ../../apps/systemApps.nix
    ../../desktop/gnome.nix
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

  # 💡 Ganti SDDM ➜ Ly
  services.xserver.enable = true;
  services.displayManager.ly.enable = true;

  # ❌ Autologin jangan aktif (Ly manual login)
  services.displayManager.autoLogin.enable = false;
  services.flatpak.enable = true;


  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  hardware.bluetooth.enable = false;

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_SESSION_TYPE = "wayland";
    NIXOS_OZONE_WL = "1";
  };

  users.users.halozra = {
    isNormalUser = true;
    description = "halozra";
    home = "/home/halozra";
    group = "halozra";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  users.groups.halozra = {};
  system.stateVersion = "26.05";
}
