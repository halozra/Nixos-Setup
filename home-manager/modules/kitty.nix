{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    
    # Konfigurasi utama (kitty.conf)
    # Theme: Tokyo Night Storm (Dark Mode)
    settings = {
      # The basic colors
      background              = "#24283b";
      foreground              = "#c0caf5";
      selection_background    = "#2e3c64";
      selection_foreground    = "#c0caf5";

      # Cursor colors
      cursor                  = "#c0caf5";
      cursor_text_color       = "#1a1b26";

      # URL color when hovering with mouse
      url_color               = "#73daca";

      # Kitty window border colors
      active_border_color     = "#7aa2f7";
      inactive_border_color   = "#292e42";

      # OS Window titlebar colors
      wayland_titlebar_color = "system";
      macos_titlebar_color   = "system";

      # Tab bar colors
      active_tab_background   = "#1f2335";
      active_tab_foreground   = "#7aa2f7";
      inactive_tab_background = "#1f2335";
      inactive_tab_foreground = "#565f89";
      tab_bar_background      = "#1d202f";

      # Storm Windows Colors
      active_text_alpha       = "1.0";

      # The 16 terminal colors
      # black
      color0 = "#1d202f";
      color8 = "#414868";

      # red
      color1 = "#f7768e";
      color9 = "#f7768e";

      # green
      color2  = "#9ece6a";
      color10 = "#9ece6a";

      # yellow
      color3  = "#e0af68";
      color11 = "#e0af68";

      # blue
      color4  = "#7aa2f7";
      color12 = "#7aa2f7";

      # magenta
      color5  = "#bb9af7";
      color13 = "#bb9af7";

      # cyan
      color6  = "#7dcfff";
      color14 = "#7dcfff";

      # white
      color7  = "#a9b1d6";
      color15 = "#c0caf5";
    };

    # Konfigurasi khusus untuk kitty diff (diff.conf)
    extraConfig = ''
      # vim:ft=kitty

      ## name: Tokyo Night Storm Diff
      
      # text
      foreground           #c0caf5
      # base
      background           #24283b

      # Diff colors
      removed_bg           #3d2b3d
      highlight_removed_bg #5a375a
      added_bg             #283b41
      highlight_added_bg   #375253

      # Search & Selection
      search_bg            #3d59a1
      search_fg            #c0caf5
      select_bg            #2e3c64
      select_fg            #c0caf5
    '';
  };
}