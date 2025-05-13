{ config, lib, pkgs, ... }:

{
  # Symlink config ke ~/.config/fastfetch/config.jsonc
  xdg.configFile."fastfetch/config.jsonc".source =
    ./config/halozra/fastfetch/config.jsonc;

  # Symlink logo.txt ke ~/.config/fastfetch/logo.txt
  xdg.configFile."fastfetch/logo.txt".source =
    ./config/halozra/fastfetch/logo.txt;
}
