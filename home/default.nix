{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ./packages.nix
    ./shell.nix
  ];

  home.username = "xbscure";
  home.homeDirectory = "/home/xbscure";
  home.stateVersion = "26.05";
}
