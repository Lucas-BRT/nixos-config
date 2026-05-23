{ pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
    mission-center
    gnome-calculator
  ];
}
