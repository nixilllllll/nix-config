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
    pkgs-unstable.firefox
    pkgs-unstable.chromium
    pkgs-unstable.telegram-desktop
    pkgs-unstable.spotify
    pkgs-unstable.zed-editor
    pkgs-unstable.vesktop

    xwayland-satellite
    walker
    elephant
    nautilus
    obsidian
    onlyoffice-desktopeditors
    bitwig-studio

    # --- MISC ---
    bibata-cursors
    papirus-icon-theme
    gruvbox-plus-icons
  ];
}
