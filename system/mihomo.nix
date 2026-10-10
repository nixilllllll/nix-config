{ config, pkgs, ... }:

{
  services.mihomo = {
    enable = true;
    configFile = "/var/lib/mihomo/config.yaml";
  };
}
