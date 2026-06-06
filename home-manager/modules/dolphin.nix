{config,pkgs,...}:
{  
  xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        # Memaksa sistem membuka folder menggunakan Dolphin, bukan Nautilus (GNOME)
        "inode/directory" = [ "org.kde.dolphin.desktop" ];
      };
    };
  
  # Opsional: Memaksa menimpa file mimeapps.list lama agar tidak konflik
  xdg.configFile."mimeapps.list".force = true;}