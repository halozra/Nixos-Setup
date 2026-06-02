{ config, pkgs, ... }:

{
  # =========================================================================
  # CONFIGURASI SYSTEM DASAR (COMMON)
  # =========================================================================
  
  # Aktifkan fitur modern Nix Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Setelan wilayah & bahasa
  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";

  # Setelan Bootloader Utama
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.systemd-boot.windows = {
    "11" = {
      title = "Windows 11";
      efiDeviceHandle = "HD1a"; # Biasanya otomatis terdeteksi, atau biarkan default/opsional tergantung versi NixOS
    };
  };

  # Setelan default shell global untuk sistem
  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;
}