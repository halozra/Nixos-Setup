{ pkgs, ... }:

{
  # 1. Aktifkan Niri Window Manager
  programs.niri.enable = true;

  # 2. Aktifkan Ly Display Manager & Matikan Autologin
  # (Ly otomatis mendeteksi sesi Niri dari /run/current-system/sw/share/wayland-sessions)
  services.displayManager.ly.enable = true;
  services.displayManager.autoLogin.enable = false;

  # 3. Keyboard Layout
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # 4. Fix Konflik Ly dengan TTY1
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # 5. XDG Portal & Polkit (Wajib untuk screen share, file picker, & otorisasi GUI)
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome # Dibutuhkan Niri untuk fitur screencast/screen sharing
    ];
  };
  security.polkit.enable = true;

  # 6. Variabel Lingkungan Wayland Murni
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Agar VS Code, Discord, Chrome jalan native Wayland
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_TYPE = "wayland";
  };

  # 7. Paket Ekosistem Niri + Waybar + SwayNC + wlogout + Wayland
  environment.systemPackages = with pkgs; [
    # Bar, Notifikasi, & Power Menu
    waybar
    swaynotificationcenter # (swaync)
    wlogout

    # Launcher & Wallpaper
    fuzzel          # Launcher super ringan berbasis Wayland (atau ganti rofi-wayland)
    swww            # Daemon wallpaper animasi/statis
    swaylock-effects # Layar kunci (lockscreen)

    # Utilitas Screenshot, Clipboard, & Sistem
    grim
    slurp
    wl-clipboard
    brightnessctl
    playerctl
    pavucontrol
    networkmanagerapplet
    polkit_gnome
    xwayland-satellite # Wajib agar aplikasi X11/Steam/Wine bisa jalan mulus di Niri
  ];
}