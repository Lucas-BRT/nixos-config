{ pkgs, ... }:

{
  imports = [ ./zed ];

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
