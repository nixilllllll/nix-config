{ pkgs, ... }:

{
  hardware.openrazer = {
    enable = true;
    users = [ "xbscure" ];
  };

  environment.systemPackages = with pkgs; [
    polychromatic
  ];
}
