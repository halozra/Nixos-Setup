{ pkgs, ... }:

{
  # Matikan fitur pencarian command yang jarang dipakai (menghemat space & waktu rebuild)
  programs.command-not-found.enable = false;

  # Optimasi Nix Store & Jadwal Bersih-bersih otomatis seminggu sekali
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1d";
  };

  # # =========================================================================
  # # XDG DESKTOP PORTAL (Jembatan File Picker Desktop)
  # # =========================================================================
  # xdg.portal = {
  #     enable = true;
  #     xdgOpenUsePortal = true;
  #     extraPortals = [ 
  #       pkgs.xdg-desktop-portal-gtk
  #     ];
  #     config = {
  #       common = {
  #         default = [ "gtk" ];
  #       };
  #     };
  #   };
}