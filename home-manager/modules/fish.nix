

{ config, lib, pkgs, ... }:

{
xdg.configFile."fish/config.fish".source =
  ./config/halozra/fish/config.fish;
}
