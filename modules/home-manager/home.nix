{ pkgs, ... }:

{
  imports = [ ./zed.nix ];

  home.username = "lucasbrt";
  home.homeDirectory = "/home/lucasbrt";

  home.packages = with pkgs; [
    # Sys and Tools
    claude-code

    # Gaming
    # heroic
    # mangohud
    # lutris
    # bottles
    # steam

    # Communication
    discord
    telegram-desktop

    # Browsers
    firefox

    # Productivity
    obsidian
    onlyoffice-desktopeditors

    # System
    mission-center
    gnome-calculator
    boxbuddy
  ];

  home.stateVersion = "25.11";

}
