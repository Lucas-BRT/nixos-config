{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Browsers
    firefox

    # Communication
    discord
    telegram-desktop

    # Office & Notes
    obsidian
    onlyoffice-desktopeditors

    # Creative
    gimp
  ];
}
