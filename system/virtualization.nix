{ config, pkgs, ... }:

{
  # 1. Aktifkan VirtualBox di level sistem OS
  virtualisation.virtualbox.host.enable = true;
  
  # 2. (Opsional) Aktifkan Extension Pack biar bisa baca USB 2.0/3.0 di dalam VM
  virtualisation.virtualbox.host.enableExtensionPack = true;

  # 3. Masukkan user halozra ke dalam grup resmi VirtualBox (vboxusers)
  users.users.halozra = {
    extraGroups = [ "vboxusers" ]; # Pakai 's' di belakangnya ya, beb!
  };
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;

}