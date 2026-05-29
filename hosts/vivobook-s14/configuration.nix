{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/laptop/default.nix
    ../../modules/DE/cosmic.nix
    ../../modules/desktop/default.nix
    ../../modules/development/system.nix
  ];

  networking.hostName = "vivobook-s14";
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

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
  boot.loader.limine = {
    enable = true;
    maxGenerations = 10;
    style.wallpapers = [ ../../wallpapers/abstract-grayscale-layered-wavy-shapes.jpg ];
    style.wallpaperStyle = "stretched";
  };
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

  # Power management: ppd integrates with COSMIC settings panel (Battery/Balanced/Performance profiles)
  services.power-profiles-daemon.enable = true;
  services.thermald.enable = true;

  # Battery charge limit to preserve long-term battery health (cap at 80%)
  # BAT1 is the device exposed by this hardware; charge_control_start_threshold is not supported by this driver
  systemd.tmpfiles.rules = [
    "w /sys/class/power_supply/BAT1/charge_control_end_threshold - - - - 80"
  ];

  # RTL8852BE WiFi D3cold suspend/resume workaround.
  # BIOS does not recover the card from D3cold after resume; D3hot works fine.
  # References:
  #   https://github.com/Lucas-BRT/rtl8852be-suspend-fix/blob/main/rtl8852be-suspend-fix.fish
  #   https://bugs.launchpad.net/ubuntu/+source/linux-hwe-6.14/+bug/2127051
  systemd.services.rtl8852be-d3cold-fix = {
    description = "RTL8852BE WiFi D3cold suspend workaround";
    wantedBy = [ "graphical.target" ];
    after = [ "display-manager.service" ];
    path = [
      pkgs.pciutils
      pkgs.gnugrep
      pkgs.gawk
    ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      pci_addr=$(lspci -D | grep -i "RTL8852BE" | awk '{print $1}')
      [ -z "$pci_addr" ] && exit 0
      attr="/sys/bus/pci/devices/$pci_addr/d3cold_allowed"
      [ -f "$attr" ] && echo 0 > "$attr"
    '';
  };
}
