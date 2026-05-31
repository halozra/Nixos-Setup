

{ config, lib, pkgs, ... }:

{
home.file."fish/config.fish".source =
  ../config/fish;
}
