{ pkgs, ...}:

{
    # Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Timezone and Internalization
    time.timeZone = "America/Fortaleza";

    # Setup experimental features
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # System Packages
    environment.systemPackages = with pkgs; [
        # Sys and Tools
        vim
        neovim
	wl-clipboard
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
	zola
	vivaldi
	asciinema

        # Languages
	rustc
	cargo
	rust-analyzer
	clippy
	rustfmt
	cargo-watch
	cargo-edit
	cargo-outdated
	cargo-audit
	cargo-nextest
	
        rustup
	cabal-install
	ghc
	nodejs_24
	python314

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

    programs.neovim = {
	enable = true;
	defaultEditor = true;
	configure = {
		customRC = ''
		set clipboard=unnamedplus
'';
	};
    };

    # Gaming extra configs
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
        extraGroups = [ "networkmanager" "wheel" "docker" ];
    };

    system.stateVersion = "25.05";

}
