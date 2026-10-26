{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    # --- PROGRAMMING ---
    go
    gopls
    python3
    ruff

    # --- CLI TOOLS ---
    bat
    btop
    eza
    fastfetch
    helix
    lazygit
    zellij

    # --- GUI APPS ---
    pkgs-unstable.firefox
    pkgs-unstable.chromium
    pkgs-unstable.telegram-desktop
    pkgs-unstable.spotify
    pkgs-unstable.zed-editor
    pkgs-unstable.vesktop

    obsidian
    onlyoffice-desktopeditors    

    # --- MISC ---
    bibata-cursors
    papirus-icon-theme
    gruvbox-plus-icons
  ];
}
