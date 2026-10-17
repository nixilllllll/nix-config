{ pkgs, ... }:

{
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  boot.loader.efi.canTouchEfiVariables = false;

  boot.kernelPackages = pkgs.linuxPackages;
}
