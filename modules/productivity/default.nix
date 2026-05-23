{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Browsers
    firefox

    # Communication
    discord
    telegram-desktop
    thunderbird

    # Office & Notes
    obsidian
    onlyoffice-desktopeditors

    # Creative
    gimp
  ];
}
