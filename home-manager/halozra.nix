{ config, pkgs, ... }:

{
  home.username = "halozra";
  home.homeDirectory = "/home/halozra";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    kitty
    tokyonight-gtk-theme
    fira-code
    papirus-nord
    fastfetch
  ];

  programs.kitty.enable = true;
  # Symlink config ke ~/.config/fastfetch/config.jsonc
  xdg.configFile."fastfetch/config.jsonc".source =
    ./config/halozra/fastfetch/config.jsonc;

  # Symlink logo.txt ke ~/.config/fastfetch/logo.txt
  xdg.configFile."fastfetch/logo.txt".source =
    ./config/halozra/fastfetch/logo.txt;

  # Symlink kitty.conf ke ~/.config/kitty/kitty.conf
  xdg.configFile."kitty/kitty.conf".source =
    ./config/halozra/kitty/kitty.conf;

  # Symlink folder tema ke ~/.config/kitty/kitty-themes
  xdg.configFile."kitty/kitty-themes".source =
    ./config/halozra/kitty/kitty-themes;

  xdg.configFile."fish/config.fish".source =
  ./config/halozra/fish/config.fish;
}


