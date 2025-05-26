{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
        ##########################
    ## 🧩 GNOME Tools & Extensions
    ##########################
    gnome-tweaks
    gnomeExtensions.pop-shell
    gnomeExtensions.blur-my-shell
    gnomeExtensions.freon
    gnomeExtensions.gsconnect
    gnomeExtensions.system-monitor

  ];


}
