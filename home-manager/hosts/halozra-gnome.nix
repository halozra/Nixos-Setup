{ config, pkgs, ... }:

{
  home.username = "halozra";
  home.homeDirectory = "/home/halozra"; 
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    gnome-tweaks
    gnomeExtensions.pop-shell
    gnomeExtensions.blur-my-shell
    gnomeExtensions.freon
    gnomeExtensions.gsconnect
    gnomeExtensions.system-monitor
    gnomeExtensions.appindicator
    gnomeExtensions.caffeine
    gnomeExtensions.user-themes
    gnomeExtensions.just-perfection
    gnomeExtensions.dash-to-dock
  ];

  # =========================================================================
  # FIX FORCE CLOSE FILE PICKER UNTUK APLIKASI HOME MANAGER
  # =========================================================================
  # Memaksa Home Manager untuk mengoper semua environment variables 
  # ke dalam systemd user service milik GNOME saat login.
  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session.target" ];
    };
  };

  # Memastikan launcher GNOME membaca path aplikasi Home Manager dengan benar
  home.sessionVariables = {
    XDG_DATA_DIRS = "$GSETTINGS_SCHEMAS_PATH:$XDG_DATA_DIRS";
  };
  # =========================================================================

  # Import eksternal modules
  imports = [
    ../../apps/apps/nix
    ../modules/fastfetch.nix
    ../modules/fish.nix
    ../modules/kitty.nix
    ../modules/fonts.nix
    ../modules/themes.nix
  ];
}