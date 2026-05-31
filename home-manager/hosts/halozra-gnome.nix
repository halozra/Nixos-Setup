{ config, pkgs, ... }:

{
  home.username = "halozra";
  home.homeDirectory = pkgs.lib.mkForce "/home/halozra";
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


  # Import eksternal modules
  imports = [
    ../modules/shared-packages.nix
    ../modules/fastfetch.nix
    ../modules/fish.nix
    ../modules/kitty.nix
    ../modules/fonts.nix
    ../modules/themes.nix
  ];
}
