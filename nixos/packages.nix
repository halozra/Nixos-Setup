{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscode
    gparted
    discord
    mongodb-ce
    mongodb-compass
    git
    fish
    starship
    lm_sensors
    gnome-tweaks
    gnomeExtensions.pop-shell
  ];
  
  nixpkgs.config.allowUnfree = true;
}
