{ config, pkgs, inputs, ... }: {
  home.packages = with pkgs; [

    # ── Terminal & Shell
    kitty
    fish
    starship
    tree
    wget
    xz

    # ── Development Tools
    gcc
    git
    nodejs
    python312Packages.pip
    vim
    neovim
    vscode
    unityhub
    drawio

    # ── Gaming Tools
    steam
    steam-run
    gamescope
    lutris
    mangohud
    dxvk
    vkd3d
    wineWowPackages.full
    winetricks
    protontricks
    osu-lazer-bin
    prismlauncher
    scanmem

    # ── Media & Creative
    vlc
    gimp
    krita
    kdePackages.kdenlive
    godotPackages_4_4.godot
    cacert

    # ── Internet & Communication
    
    discord

    # ── Database Tools
    mongodb-compass
    postman

    # ── System Utilities
    home-manager
    gparted
    unrar
    flatpak
    kdePackages.ark
    pavucontrol
    easyeffects

    # Browser
    librewolf
    google-chrome

  ];
}
