{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Hyperland setup
    hyprland
    waybar
    wayland
    wayland-utils
    wlogout
    rofi-wayland-unwrapped


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
    lutris-unwrapped
    steam
    kdePackages.kdenlive
    godot_4

    # pkgs system

    ntfs3g
    vulkan-tools
    vulkan-loader
    libGL
    libglvnd
    mesa
    amdvlk
    libvdpau-va-gl
    vim
    neovim
    gcc
    dxvk
    dconf
    glib-networking
    python312Packages.pip



    mangohud
    git
    fish
    starship
    earlyoom
    nodejs
    lm_sensors
    xdg-utils
    gamescope
    gnome-tweaks
    gnomeExtensions.pop-shell
    gnomeExtensions.blur-my-shell
    gnomeExtensions.freon
    gnomeExtensions.gsconnect
    winePackages.stable
    winetricks
    easyeffects
    tree
  ];

  nixpkgs.config.allowUnfree = true;
}
