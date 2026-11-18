
{ pkgs, ... }:

{
  # =========================================================================
  # KERNEL CONFIGURATION & OPTIMIZATION
  # =========================================================================

  # Latest stable kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Kernel Parameters
  boot.kernelParams = [
    # AMD GPU PowerPlay feature mask
    # Aktifkan hanya jika memang diperlukan
    "amdgpu.ppfeaturemask=0xffffffff"
  ];

  # Kernel Sysctl
  boot.kernel.sysctl = {
    # Memory optimization
    "vm.swappiness" = 10;

    # File watcher limit
    "fs.inotify.max_user_watches" = 524288;

    # Network TTL
    "net.ipv4.ip_default_ttl" = 64;
  };

  # Kernel Modules
  boot.kernelModules = [
    "i2c-dev"
    "i2c-piix4"
  ];
}
