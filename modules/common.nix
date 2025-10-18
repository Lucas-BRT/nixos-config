{ pkgs, ...}:

{
    # Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Timezone and Internalization
    time.timeZone = "America/Fortaleza";

    # System Packages
    environment.systemPackages = with pkgs; [
        # Sys and Tools
        vim
        neovim
        fish
        git
        gh
        wget
        alacritty
        tmux
        libpq
        curl
        openssl
        clang
        gcc
        gemini-cli
        pkg-config

        # Languages
        rustup

        # Gaming
        heroic
        mangohud
        lutris
        bottles
        discord
        steam

        # Utils
        firefox
        bitwarden
        zed-editor
        onlyoffice-bin
        obsidian
        megasync
        sqlx-cli
        mission-center
    ];

    # Gaming extra configs
    programs.steam = {
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
        gamescopeSession.enable = true;
    };
    programs.gamemode.enable = true;

    # Shell extra configs
    programs.fish.enable = true;

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
        extraGroups = [ "networkmanager" "wheel" "docker" ];
        shell = pkgs.fish;
    };

    system.stateVersion = "25.05";

}
