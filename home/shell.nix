{ pkgs, ... }:

{
  imports = [
    ./aliases.nix # Подключаем твои алиасы
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
    };

    initContent = ''
      zstyle ':completion:*' menu select
    '';
  };

  programs.starship.enable = true;
}
