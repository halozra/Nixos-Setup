{ config, lib, pkgs, ... }:

{
  programs.kitty.enable = true;

  # Declarative + file-based hybrid
  xdg.configFile."kitty/kitty.conf".source =
    ../config/halozra/kitty/kitty.conf;

  xdg.configFile."kitty/kitty-themes".source =
    ../config/halozra/kitty/kitty-themes;
}
