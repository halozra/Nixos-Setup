{ config, lib, pkgs, ... }:

{
  programs.kitty.enable = true;

  xdg.configFile."kitty".source =
    ../config/kitty;
}
