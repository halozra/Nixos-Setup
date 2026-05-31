{ config, pkgs, ... }:

{
  home.pointerCursor = if config.hyprland.enable then {
    name = "Adwaita";
    size = 24;
    package = pkgs.gnome-themes-extra;
    gtk.enable = true;
    x11.enable = true;
  } else null;
}
