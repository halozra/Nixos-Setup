
{ ... }:

{
  # ==========================================
  # MEMORY MANAGEMENT
  # ==========================================

  services.earlyoom.enable = true;


  # ==========================================
  # FILESYSTEM & REMOVABLE STORAGE
  # ==========================================

  services.gvfs.enable = true;
  services.udisks2.enable = true;


  # ==========================================
  # AMD GPU TUNING
  # ==========================================

  services.lact.enable = true;
}
