{
  imports = [
    ../../modules/hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/packages.nix
    ../../modules/services.nix
    ../../modules/packages-gnome.nix
  ];

  services.xserver.enable = true;

  # Pakai Ly sebagai Display Manager
  services.displayManager.ly.enable = true;

  # Nonaktifkan autoLogin karena Ly manual login
  services.displayManager.autoLogin.enable = false;


  # Aktifkan GNOME desktop environment
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  users.users.halozra = {
    isNormalUser = true;
    group = "halozra";
    description = "halozra";
    home = "/home/halozra";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  users.groups.halozra = {};
  system.stateVersion = "25.05";
}
