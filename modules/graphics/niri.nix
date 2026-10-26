{ pkgs, pkgs-unstable, ... }:

{
  hardware.i2c.enable = true;

  users.users.xbscure.extraGroups = [ "i2c" ];

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
