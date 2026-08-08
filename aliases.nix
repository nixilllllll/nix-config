{ pkgs, ... }:

{
  environment.shellAliases = {
    # --- NIX ---
    nixconf = "SUDO_EDITOR=\"zeditor --wait\" sudoedit /etc/nixos/configuration.nix";
    flakeconf = "SUDO_EDITOR=\"zeditor --wait\" sudoedit /etc/nixos/flake.nix";
    update = "sudo nixos-rebuild switch";
    # --- SH ---
    aliasconf = "SUDO_EDITOR=\"zeditor --wait\" sudoedit /etc/nixos/aliases.nix";
    # --- SYSTEM ---
    logout = "niri msg action quit";
    g-status = "supergfxctl -g";
    g-int = "supergfxctl -m Integrated";
    g-hyb = "supergfxctl -m Hybrid";
    # --- MISC ---
    ls = "eza --icons=always";
  };
}
