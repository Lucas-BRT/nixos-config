{ pkgs, ... }:

{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Timezone and Internalization
  time.timeZone = "America/Fortaleza";

  # Setup experimental features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Setup do Cosmic
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
  services.system76-scheduler.enable = true;
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
  services.xserver.enable = true;
  services.desktopManager.cosmic.xwayland.enable = true;

  # Hardware Graphics Aceleration
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  # Setup ao Flatpak
  services.flatpak.enable = true;

  # Optimize Storage
  nix.optimise.automatic = true;
  nix.settings.auto-optimise-store = true;

  # System Packages
  environment.systemPackages = with pkgs; [
    curl
    openssl
    pkg-config
    vim
    neovim
    git
    wget
  ];

  environment.variables = {
    PKG_CONFIG_PATH = [
      "${pkgs.openssl.dev}/lib/pkgconfig"
    ];
  };

  programs.nix-ld = {
    enable = true;
    libraries = [
      pkgs.zlib
      pkgs.openssl
    ];
  };


  # Allow non-free software
  nixpkgs.config.allowUnfree = true;

  # Services
  services.openssh.enable = true;
  virtualisation.docker = {
    enable = true;
  };
  services.printing.enable = true;


  # Sound Settings
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # User Account
  users.users.lucasbrt = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  system.stateVersion = "25.11";

}
