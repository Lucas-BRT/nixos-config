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

  # System Packages
  environment.systemPackages = with pkgs; [
    fish
    curl
    openssl
    distrobox
    cosmic-ext-calculator
    cosmic-ext-tweaks
  ];

  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
  ];

  #Gaming extra configs
  programs.steam = {
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    gamescopeSession.enable = true;
  };
  programs.gamemode.enable = true;

  # Shell extra configs
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # Allow non-free software
  nixpkgs.config.allowUnfree = true;

  # Services
  services.openssh.enable = true;
  virtualisation.docker = {
    enable = true;
  };
  services.printing.enable = true;

  # Hardware Graphics Aceleration
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  # Desktop Environment Settings
  services.xserver.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;
  services.desktopManager.cosmic.xwayland.enable = true;

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

  # Enable virtualbox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "lucasbrt" ];

  system.stateVersion = "25.05";

}
