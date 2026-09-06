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
    flclash
    alacritty
    ghostty
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
    gruvbox-plus-icons
  ];
}
