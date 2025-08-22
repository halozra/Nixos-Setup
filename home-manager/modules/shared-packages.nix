{ config, pkgs, inputs, ... }: {
  home.packages = with pkgs; [
  kitty
  tokyonight-gtk-theme
  fira-code
  papirus-nord
  fastfetch
  bibata-cursors
  nerd-fonts.fira-code
  nerd-fonts.jetbrains-mono
  vscode
  gparted
  discord
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
  home-manager
  jetbrains.pycharm-community-bin


  vim
  neovim
  gcc
  nodejs
  python312Packages.pip
  git

  lutris
  dxvk
  vkd3d
  mangohud
  gamescope
  wineWowPackages.full
  winetricks
  protonup-qt
  protontricks

  fish
  starship

  easyeffects
  pavucontrol
  kdePackages.ark
  unrar
  tree
  flatpak

  ];
}