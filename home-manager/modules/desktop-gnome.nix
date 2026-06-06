{ pkgs, ... }:

{
  # 1. dconf wajib aktif agar tema & extension dibaca sistem
  dconf.enable = true;

  # 2. Aplikasi utilitas pendukung GNOME
  home.packages = with pkgs; [
    gnome-tweaks
  ];

  # 3. Manajemen Gnome Extensions otomatis lewat Home Manager
  programs.gnome-extensions = {
    enable = true;
    extensions = with pkgs.gnomeExtensions; [
      pop-shell
      blur-my-shell
      freon
      gsconnect
      system-monitor
      appindicator
      caffeine
      user-themes
      just-perfection
      dash-to-dock
    ];
  };

  # 4. Memaksa GNOME untuk langsung menyalakan semua extension di atas pas kamu login
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "pop-shell@system76.com"
        "blur-my-shell@alignment"
        "freon@UshakovAlexander"
        "gsconnect@andyholmes.github.io"
        "system-monitor@neolao.org"
        "appindicatorsupport@rgcjonas.gmail.com"
        "caffeine@patapon.info"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "just-perfection-desktop@just-perfection"
        "dash-to-dock@micxgx.gmail.com"
      ];
    };
  };
}