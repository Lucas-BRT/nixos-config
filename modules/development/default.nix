{ pkgs, ... }:

{
  imports = [ ./zed ];

  programs.mise.enable = true;
  programs.fish.enable = true;

  home.packages = with pkgs; [
    claude-code
    gh
    clang
    zellij
    zola
    insomnia
    boxbuddy
  ];
}
