{ pkgs, ... }:

{
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono # mono font for code and terminal
    inter # perfect font for interfaces
    corefonts # fonts for office
    vista-fonts # fonts for office
  ];
}
