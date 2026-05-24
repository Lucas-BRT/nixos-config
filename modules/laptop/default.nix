{ ... }:

{
  # SSD/NVMe health — runs TRIM weekly
  services.fstrim.enable = true;

  # Battery info daemon — COSMIC reads from here for battery % and events
  services.upower.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Firmware updates (BIOS, drivers, embedded controllers)
  services.fwupd.enable = true;

  # Distribute hardware interrupts across CPU cores
  services.irqbalance.enable = true;

  # Compressed RAM swap — reduces disk I/O on memory pressure
  zramSwap.enable = true;
  zramSwap.algorithm = "zstd";
}
