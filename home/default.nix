{ ... }:

{
  imports = [
    ./packages.nix
    ./shell.nix
    ./dev.nix
    ./shared/programs/gui.nix
  ];

  home.username = "xbscure";
  home.stateVersion = "26.05";
}
