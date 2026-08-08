# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, pkgs-unstable, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./aliases.nix
      ./virtualisation.nix
    ];

# --- BOOTLOADER ---
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.plymouth = {
    enable = true;
    theme = "bgrt"; # Базовая тема с логотипом NixOS/UEFI (BGRT theme)
  };

  # Параметры ядра для чистого и тихой загрузки
  boot.kernelParams = [
    "quiet"                        # Скрыть системные сообщения (Quiet boot)
    "splash"                       # Включить сплэш-экран (Enable splash)
    "boot.shell_on_fail"           # Консоль при ошибке (Shell on failure)
    "loglevel=3"                   # Уровень логов только критический (Log level 3)
    "rd.systemd.show_status=false" # Скрыть статус systemd в initrd (Hide systemd status in initrd)
    "rd.udev.log_level=3"          # Уровень логов udev (udev log level)
    "vt.global_cursor_default=0"   # Скрыть мигающий курсор (Disable blinking cursor)
  ];

# --- POWER MANAGEMENT ---
    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;
    services.asusd.enable = true;
    services.supergfxd.enable = true;

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
    };

    services.udev.extraRules = ''
      SUBSYSTEM=="power_supply", KERNEL=="BAT1", ATTR{charge_control_end_threshold}="80"
    '';

# --- SHELL ---

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
    };

    interactiveShellInit = ''
      zstyle ':completion:*' menu select
    '';
  };

  programs.starship.enable = true;

# --- NIX FEATURES ---
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # --- DISPLAY MANAGER ---
  programs.regreet = {
      enable = true;

      # 1. Шрифт и курсор
      font = {
        name = "Inter Medium";
        size = 12;
      };
      cursorTheme = {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
      };

      # 2. Иконки и GTK-тема
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };

      # 3. Путь к обоям (укажи свой путь к картинке)
      # background = "/path/to/your/wallpaper.png";

      # 4. Тонкая настройка интерфейса ReGreet
      settings = {
        background = {
          fit = "Cover"; # Растянуть обои (Contain / Cover)
        };
        GTK = {
          application_prefer_dark_theme = true;
        };
        appearance = {
          greeting_msg = "Welcome back"; # Приветственная надпись
        };
      };
    };

  # idk it's was proxy but my laptop erased this file partly
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
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

# --- GRAPHICS ---

  # WM
  programs.niri.enable = true;

# --- SOUND ---

  # Sound via PipeWire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

# --- USERS ---

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."xbscure" = {
    isNormalUser = true;
    description = "xbscure";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

# --- PACKAGES & APPS ---

  # Allow AppImage
  # programs.appimage.enable = true;

  # Unfree packages setting
  nixpkgs.config.allowUnfree = true;

# --- FONTS ---
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono # mono font for code and terminal
    inter # perfect font for interfaces
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
# --- LANGUAGES ---
  # GO
    go
    gopls
  # Python
    python3

# --- CLI TOOLS ---
  vim
  neovim
  wget
  curl
  git
  zellij # terminal multiplexer

  bat # 'cat' with syntax
  eza # just better 'ls'

  fastfetch # fast system info
  btop # machine monitoring

  cowsay # i use NixOS btw
  lavat # lava lamp
  cava

# --- GUI APPS ---
  pkgs-unstable.noctalia # desktop shell on c++
  flclash # VPN (just for normal internet, need some fixes and can't get config from sosa's sub)
  alacritty # terminal emulator
  xwayland-satellite # for fucking x11 apps
  fuzzel # app launcher
  zed-editor # text editor
  firefox # browser
  obsidian # notes
  telegram-desktop # messager
  spotify # music
  qbittorrent # torrent tracker


  # --- MISC ---
    bibata-cursors # cute cursor for system
    papirus-icon-theme
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
