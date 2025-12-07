{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # Nvidia RTX 3050 Settings
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = false;
  hardware.nvidia.nvidiaSettings = true;
  hardware.graphics.extraPackages = with pkgs; [
    intel-vaapi-driver
    libva-vdpau-driver
    libvdpau-va-gl
  ];
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
  systemd.services.nvidia-persistenced.enable = true;

  # Setup local IA
  services.ollama = {
    enable = true;
    package = pkgs.ollama;
    acceleration = "cuda";
  };

  environment.systemPackages = with pkgs; [
    cudatoolkit
  ];

  environment.variables = {
    CUDA_PATH = "${pkgs.cudatoolkit}";
    LD_LIBRARY_PATH = "${pkgs.cudatoolkit}/lib";
    OLLAMA_GPU = "cuda";
  };
}
