{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/DE/cosmic.nix
    ../../modules/desktop/default.nix
    ../../modules/development/system.nix
  ];

  networking.hostName = "vivobook-s14";
  networking.networkmanager.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  console.keyMap = "br-abnt2";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Intel Arc Xe (Meteor Lake) - enable GuC/HuC for better performance and power savings
  boot.kernelParams = [ "i915.enable_guc=3" ];

  # Firmware
  hardware.enableRedistributableFirmware = true;

  # Intel graphics - VA-API / Quick Sync
  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
    vpl-gpu-rt
    intel-compute-runtime
  ];

  environment.variables.LIBVA_DRIVER_NAME = "iHD";

  # Power management (disable power-profiles-daemon, conflicts with auto-cpufreq)
  services.power-profiles-daemon.enable = false;
  services.auto-cpufreq.enable = true;
  services.thermald.enable = true;
}
