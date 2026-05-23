{ ... }:

{
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  services.flatpak.enable = true;
  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.lucasbrt.extraGroups = [ "networkmanager" ];
}
