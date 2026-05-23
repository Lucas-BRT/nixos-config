{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/DE/cosmic.nix
    ../../modules/desktop/default.nix
    ../../modules/development/system.nix
  ];

  networking.hostName = "desktop";
  networking.networkmanager.enable = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # AMD RX drivers
  services.xserver.videoDrivers = [ "amd" ];
}
