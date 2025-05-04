{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    #pkgs app
    vscode
    gparted
    discord
    mongodb-ce
    mongodb-compass
    postman
    drawio
    krita
    gimp
    vlc
    lutris
    steam
    kdePackages.kdenlive

    # pkgs system
    vulkan-tools
    mangohud
    git
    fish
    starship
    earlyoom
    nodejs
    lm_sensors
    xdg-utils
    gamescope
    protontricks
    gnome-tweaks
    gnomeExtensions.pop-shell
    gnomeExtensions.blur-my-shell
    gnomeExtensions.freon
    winePackages.stable
  ];

  nixpkgs.config.allowUnfree = true;
}
