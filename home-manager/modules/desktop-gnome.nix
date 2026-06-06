{ pkgs, ... }:

{
  # 1. dconf wajib aktif agar tema & konfigurasi extension dibaca oleh GNOME
  dconf.enable = true;

  # 2. Kembalikan paket extension ke home.packages (Cara aman & valid di Home Manager)
  home.packages = with pkgs; [
    gnome-tweaks
    gnomeExtensions.pop-shell
    gnomeExtensions.blur-my-shell
    gnomeExtensions.freon
    gnomeExtensions.gsconnect
    gnomeExtensions.system-monitor
    gnomeExtensions.appindicator
    gnomeExtensions.caffeine
    gnomeExtensions.user-themes
    gnomeExtensions.just-perfection
    gnomeExtensions.dash-to-dock
  ];

  # 3. Otomatisasi dconf biar pas beres rebuild, extension-nya LANGSUNG NYALA
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false; # Izinkan extension pihak ketiga
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