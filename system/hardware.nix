{ config, pkgs, ... }:

{
  # --- POWER MANAGEMENT ---
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.asusd.enable = true;
  services.supergfxd.enable = true;

  services.udev.extraRules = ''
    SUBSYSTEM=="power_supply", KERNEL=="BAT1", ATTR{charge_control_end_threshold}="80"
  '';

  # --- GRAPHICS ---
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;

    prime = {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };
          amdgpuBusId = "PCI:5:0:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };

  # --- SOUND  ---
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # --- BLUETOOTH ---
  hardware.bluetooth.enable = true;
}
