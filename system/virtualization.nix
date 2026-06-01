{ ... }:

{
  # Mengaktifkan modul kernel host VirtualBox
  virtualisation.virtualbox.host.enable = true;
  
  # Otomatis mendaftarkan user utama ke grup VirtualBox
  users.extraGroups.vboxusers.members = [ "halozra" ]; 
}