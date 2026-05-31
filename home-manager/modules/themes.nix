{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tokyonight-gtk-theme
    whitesur-gtk-theme
    papirus-nord
    tela-icon-theme
    bibata-cursors
  ];
}
