{ pkgs, ... }:

{
  # --- NIX FEATURES ---
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;
  home-manager.backupFileExtension = "backup";

  programs.nh = {
    enable = true;
    flake = "/home/xbscure/.config/nixos";
  };

  # --- USERS and SHELL ---
  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."xbscure" = {
    isNormalUser = true;
    home = "/home/xbscure";
    group = "xbscure";
    description = "xbscure";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  users.groups.xbscure = { };

  # --- TIMEZONE and LOCALES ---
  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # --- PACKAGES ---
  environment.systemPackages = with pkgs; [
    neovim
    git
    curl
  ];
}
