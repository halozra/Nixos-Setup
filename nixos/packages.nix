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
    hyprpaper
    hyprlock
    swaybg
    grim
    slurp
    dunst
    networkmanagerapplet
    gtk4
    fontconfig

    ##########################
    ## 🔤 Fonts
    ##########################
    fira-code-nerdfont
    font-awesome

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
    lutris-unwrapped

    ##########################
    ## ⚙️ System Utilities & Drivers
    ##########################
    ntfs3g
    vulkan-tools
    vulkan-loader
    libGL
    libglvnd
    mesa
    amdvlk
    libvdpau-va-gl
    dconf
    glib-networking
    xdg-utils
    lm_sensors
    earlyoom
    tree

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
    mangohud
    gamescope
    winePackages.stable
    winetricks
    protonup-qt

    ##########################
    ## 🐚 Shell & CLI Enhancements
    ##########################
    fish
    starship

    ##########################
    ## 🔊 Audio Enhancement
    ##########################
    easyeffects

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
