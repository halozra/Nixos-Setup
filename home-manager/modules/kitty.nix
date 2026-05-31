{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    
    # Konfigurasi utama (kitty.conf)
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
    };

    # Konfigurasi khusus untuk kitty diff (diff.conf)
    extraConfig = ''
      # Taruh isi konfigurasi diff.conf kamu di sini
      map ctrl+shift+p open_url_with_hints
    '';
  };
}
