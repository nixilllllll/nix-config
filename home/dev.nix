{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ansible
    ansible-lint
    sshpass
    nil
    nixd
  ];
}
