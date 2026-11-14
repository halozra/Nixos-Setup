{ config, lib, pkgs, ... }:

{

  xdg.configFile."fastfetch".source =
    ../config/fastfetch;
}
