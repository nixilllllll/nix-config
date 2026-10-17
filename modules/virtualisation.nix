{ ... }:

{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ "xbscure" ];

  environment.sessionVariables = {
    LIBVIRT_DEFAULT_URI = "qemu:///system";
  };
}
