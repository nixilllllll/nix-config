{ pkgs, ... }:

{
  home.shellAliases = {
    # --- NIX ---
    nix-conf = "zeditor ~/.config/nixos/system/configuration.nix";
    flake-conf = "zeditor ~/.config/nixos/flake.nix";
    nix-update = "sudo nixos-rebuild switch --flake ~/.config/nixos/#nixos";

    # --- SH ---
    alias-conf = "zeditor ~/.config/nixos/home/aliases.nix";

    # --- SYSTEM ---
    logout = "niri msg action quit";
    g-status = "supergfxctl -g";
    g-int = "supergfxctl -m Integrated";
    g-hyb = "supergfxctl -m Hybrid";

    # --- MISC ---
    ls = "eza --icons=always --group-directories-first";

    # --- PROGRAMMING ---
    v = "nvim";
    z = "zeditor";
  };
}
