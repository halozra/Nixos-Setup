{ config, pkgs, inputs, ... }: {

  home.packages = with pkgs; [

    # ── Terminal & Shell
    kitty
    starship
    tree
    wget

    # ── Development Tools
    git
    nodejs
    neovim
    vscode
    unityhub
    drawio

    # ── Gaming Tools
    steam-run
    lutris
    mangohud
    wineWow64Packages.full
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

    # ── Internet & Communication
    discord

    # ── Database Tools
    mongodb-compass
    postman

    # ── System Utilities
    home-manager
    unrar
    kdePackages.ark
    pavucontrol
    easyeffects
    yazi
    winbox
    gns3-gui
    gns3-server

    # ── Browser
    librewolf
    google-chrome
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

  ];
}