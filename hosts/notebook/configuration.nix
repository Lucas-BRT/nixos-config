{  ... }:

{
    imports = [ ./hardware-configuration.nix ];

    # Setup Drivers
    services.xserver.videoDrivers = ["amd"];

}
