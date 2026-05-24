{ pkgs-unstable, ... }:

{
  nixpkgs.overlays = [
    (_: _: {
      inherit (pkgs-unstable)
        cosmic-applets
        cosmic-applibrary
        cosmic-bg
        cosmic-comp
        cosmic-edit
        cosmic-files
        cosmic-greeter
        cosmic-icons
        cosmic-idle
        cosmic-launcher
        cosmic-notifications
        cosmic-osd
        cosmic-panel
        cosmic-player
        cosmic-randr
        cosmic-screenshot
        cosmic-session
        cosmic-settings
        cosmic-settings-daemon
        cosmic-store
        cosmic-term
        cosmic-wallpapers
        cosmic-workspaces-epoch
        pop-launcher
        xdg-desktop-portal-cosmic;
    })
  ];

  services.desktopManager.cosmic.enable = true;
  services.desktopManager.cosmic.xwayland.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
  services.system76-scheduler.enable = true;
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
}
