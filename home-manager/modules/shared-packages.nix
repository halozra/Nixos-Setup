{ pkgs, ... }: {
  home.packages = with pkgs; [
  kitty
  tokyonight-gtk-theme
  fira-code
  papirus-nord
  fastfetch
  bibata-cursors
  pkgs.nerd-fonts.fira-code
  pkgs.nerd-fonts.jetbrains-mono
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

  vim
  neovim
  gcc
  nodejs
  python312Packages.pip
  git
  htop

  lutris
  dxvk
  vkd3d
  mangohud
  gamescope
  wineWowPackages.full
  winetricks
  protonup-qt

  fish
  starship

  easyeffects
  pavucontrol
  kdePackages.ark
  unrar
  tree

  ];
}