{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    # --- PROGRAMMING ---
    go
    gopls
    python3
    ruff

    # --- CLI TOOLS ---
    ddcutil
    brightnessctl
    vim
    neovim
    helix
    wget
    curl
    git
    lazygit
    zellij
    bat
    eza
    fastfetch
    btop
    cowsay
    lavat
    cava

    # --- GUI APPS ---
    pkgs-unstable.noctalia
    pkgs-unstable.flclash
    pkgs-unstable.firefox
    pkgs-unstable.telegram-desktop
    pkgs-unstable.spotify

    alacritty
    ghostty
    xwayland-satellite
    fuzzel
    nautilus
    zed-editor
    obsidian

    # --- MISC ---
    bibata-cursors
    papirus-icon-theme
    gruvbox-plus-icons
  ];
}
