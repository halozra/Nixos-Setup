{ pkgs, ... }:

{
  # 1. Aktifkan KDE Plasma 6 Desktop Environment
  services.desktopManager.plasma6.enable = true;
  
  # 2. Aktifkan Ly Display Manager & Matikan Autologin
  services.displayManager.ly.enable = true;
  services.displayManager.autoLogin.enable = false;

  # 3. Keyboard Layout
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # 4. Fix Konflik Ly dengan TTY1 (Biar ga gontok-gontokan)
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # 5. Anti-Tidur (No Sleep) via Kdeglobals / Powerdevil
  # KDE tidak pakai GSettings/dconf untuk power management, melainkan file teks (.config).
  # Ini cara memaksa KDE agar layar tidak mati/sleep saat dicolok listrik (AC).
  services.desktopManager.plasma6.extraPackages = with pkgs; [
    kdePackages.plasma-systemmonitor # Opsional: Monitor sistem bawaan KDE yang cakep
  ];

  # Catatan untuk No Sleep di KDE: 
  # Karena KDE menyimpan konfigurasi power di level user (~/.config/powermanagementprofilesrc),
  # cara paling efektif untuk mematikan auto-sleep adalah langsung dari System Settings KDE lewat GUI,
  # atau kamu deklarasikan di Home Manager nanti.
}