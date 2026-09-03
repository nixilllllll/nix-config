{ config, pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.xbscure.extraGroups = [ "libvirtd" ];

  environment.sessionVariables = {
    LIBVIRT_DEFAULT_URI = "qemu:///system";
  };
}
