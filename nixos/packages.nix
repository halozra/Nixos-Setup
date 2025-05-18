{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    ##########################
    ## 🖥️ Hyprland & Wayland Setup
    ##########################
    hyprland
    waybar
    wayland
    wayland-utils
    wlogout
    rofi-wayland-unwrapped
    hyprlock
    swaybg
    grim
    slurp
    dunst
    networkmanagerapplet
    gtk4
    fontconfig
    polkit
    wget
    bluez


    ##########################
    ## 🔤 Fonts
    ##########################
      # Fonts section
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "JetBrainsMono"
        "Hack"
        "Noto"
      ];
    })
    font-awesome
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    material-design-icons


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
    lutris

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
    chromium


    ##########################
    ## 🧩 GNOME Tools & Extensions
    ##########################
    gnome-tweaks
    gnomeExtensions.pop-shell
    gnomeExtensions.blur-my-shell
    gnomeExtensions.freon
    gnomeExtensions.gsconnect
  ];
}
