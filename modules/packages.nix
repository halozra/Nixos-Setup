{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [


    ##########################
    ## 🧰 Aplikasi Umum & Produktivitas
    ##########################
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
    steam
    kdePackages.kdenlive
    godot_4
    osu-lazer-bin


    ##########################
    ## ⚙️ System Utilities & Drivers
    ##########################
    ntfs3g
    vulkan-tools
    vulkan-loader
    mesa
    vulkan-utility-libraries
    gnutls

    dconf
    glib-networking
    xdg-utils
    lm_sensors
    earlyoom
    tree
    kdePackages.ark
    unrar
    ntfs3g

    ##########################
    ## 🧑‍💻 Developer Tools
    ##########################
    vim
    neovim
    gcc
    nodejs
    python312Packages.pip
    git
    htop

    ##########################
    ## 🎮 Gaming / Performance Tools
    ##########################
    lutris
    dxvk
    vkd3d
    mangohud
    gamescope
    wineWowPackages.full
    winetricks
    protonup-qt
    driversi686Linux.mesa

    ##########################
    ## 🐚 Shell & CLI Enhancements
    ##########################
    fish
    starship

    ##########################
    ## 🔊 Audio Enhancement
    ##########################
    easyeffects
    pavucontrol



  ];


}
