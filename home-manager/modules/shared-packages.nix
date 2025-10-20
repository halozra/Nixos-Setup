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
    jetbrains.pycharm-community-bin
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
    protonup-qt
    protontricks
    osu-lazer-bin
    prismlauncher
    scanmem
    openrgb-with-all-plugins

    # ── Media & Creative
    vlc
    gimp
    krita
    kdePackages.kdenlive
    godot_4

    # ── Internet & Communication
    google-chrome
    discord

    # ── Database Tools
    mongodb-compass
    postman

    # ── GTK / Icon / Theme / Fonts
    tokyonight-gtk-theme
    whitesur-gtk-theme
    papirus-nord
    tela-icon-theme
    bibata-cursors
    fira-code
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono

    # ── System Utilities
    home-manager
    gparted
    unrar
    flatpak
    kdePackages.ark
    pavucontrol
    easyeffects
  ];
}
