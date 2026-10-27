{ pkgs, pkgs-unstable, ... }:

{
  hardware.i2c.enable = true;
  users.users.xbscure.extraGroups = [ "i2c" ];

  hardware.bluetooth.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  programs.niri = {
    enable = true;
    useNautilus = true;
  };

  environment.systemPackages = with pkgs; [
    pkgs-unstable.noctalia
    ddcutil
    brightnessctl
    xwayland-satellite
    walker
    elephant
    nautilus
  ];
}
