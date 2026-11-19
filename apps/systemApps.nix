
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Hardware Diagnostics
    lm_sensors
    i2c-tools
    pciutils
    usbutils
    smartmontools
    nvme-cli

    # Filesystem
    ntfs3g

    # Graphics & Vulkan Diagnostics
    vulkan-tools
    vulkan-validation-layers

  ];
}
