{ pkgs-unstable, ... }:

{
  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    package = pkgs-unstable.steam;
    gamescopeSession.enable = true;
  };
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  environment.systemPackages = with pkgs-unstable; [
    heroic
    hydralauncher
    lutris
    bottles

    # Compatibilidade
    protonup-qt
    protontricks
    winetricks

    # Overlay
    goverlay
    vkbasalt
  ];

  home-manager.users.lucasbrt = {
    programs.mangohud.enable = true;
  };
}
