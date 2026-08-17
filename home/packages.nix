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
    wget
    curl
    git
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
    flclash
    alacritty
    xwayland-satellite
    fuzzel
    nautilus
    zed-editor
    firefox
    sioyek
    obsidian
    telegram-desktop
    spotify

    # --- MISC ---
    bibata-cursors
    papirus-icon-theme
  ];
}
