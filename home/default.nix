{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ./packages.nix
    ./shell.nix
  ];

  home.username = "xbscure";
  home.homeDirectory = "/home/xbscure";
  home.stateVersion = "26.05";

  # --- ТЕМЫ И ИКОНКИ PAPIRUS ---
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };

  # Переменные окружения пользователя
  home.sessionVariables = {
    EDITOR = "zeditor";
  };
}
