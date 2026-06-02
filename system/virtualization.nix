{ ... }:

{
  # Mengaktifkan modul kernel host VirtualBox
  virtualisation.virtualbox.host.enable = true;
  
  # Otomatis mendaftarkan user utama ke grup VirtualBox
  users.extraGroups.vboxusers.members = [ "halozra" ]; 
  # Mengaktifkan Docker Daemon
  virtualisation.docker.enable = true;

  # Otomatis menambahkan user kamu ke dalam grup docker 
  # Supaya bisa jalanin perintah docker tanpa harus ngetik 'sudo' terus-menerus
  users.users.halozra.extraGroups = [ "docker" ];
}