{ config, pkgs, ... }:
{
  # =========================================================================
  # AUDIO (PipeWire Modern)
  # =========================================================================
  security.rtkit.enable = true;
  services.pulseaudio.enable = false; # Sudah digantikan oleh PipeWire

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}