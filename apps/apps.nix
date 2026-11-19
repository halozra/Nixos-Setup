
{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [

    # ==========================================
    # TERMINAL & SHELL
    # ==========================================
    kitty
    starship
    fastfetch
    yazi
    tree

    # Terminal utilities
    bat
    eza
    btop
    duf
    dust
    tldr
    which
    file

    # Search & navigation
    fzf
    ripgrep
    fd
    jq
    zoxide

    # Network downloads
    wget

    # ==========================================
    # SOFTWARE DEVELOPMENT
    # ==========================================
    # Languages & runtimes
    nodejs
    pnpm
    go
    python3
    rustc
    cargo

    # Editors & Git tools
    neovim
    vscode
    gh
    lazygit
    git

    # ==========================================
    # BUILD TOOLS
    # ==========================================
    gcc
    gnumake
    cmake
    ninja
    gdb
    pkg-config

    # ==========================================
    # LANGUAGE SERVERS & FORMATTERS
    # ==========================================
    gopls
    typescript
    typescript-language-server
    prettier

    # Code quality
    
    shellcheck
    shfmt

    # ==========================================
    # GAME DEVELOPMENT & DESIGN
    # ==========================================
    unityhub
    godotPackages_4_7.godot
    blender
    drawio
    aseprite

    # ==========================================
    # ANDROID DEVELOPMENT
    # ==========================================
    android-tools

    # ==========================================
    # GAMING
    # ==========================================
    lutris
    mangohud
    wineWow64Packages.full
    winetricks
    protontricks
    protonup-qt

    # Games & utilities
    osu-lazer-bin
    prismlauncher
    scanmem

    # ==========================================
    # MEDIA & CREATIVE
    # ==========================================
    vlc
    gimp
    krita
    kdePackages.kdenlive

    # ==========================================
    # INTERNET & COMMUNICATION
    # ==========================================
    discord

    # Browsers
    librewolf
    google-chrome

    # ==========================================
    # DATABASE & API
    # ==========================================
    mongodb-compass
    postman

    # ==========================================
    # NETWORKING & IT
    # ==========================================
    winbox
    gns3-gui
    gns3-server

    # Network diagnostics
    nmap
    tcpdump
    iperf3
    mtr
    traceroute
    dnsutils
    whois
    ethtool

    # ==========================================
    # AUDIO UTILITIES
    # ==========================================
    pavucontrol
    easyeffects

    # ==========================================
    # ARCHIVE UTILITIES
    # ==========================================
    unrar
    unzip

    # ==========================================
    # ZEN BROWSER
    # ==========================================
    inputs.zen-browser.packages
      .${pkgs.stdenv.hostPlatform.system}.default
  ];
}
