{ pkgs, ... }:

{
  imports = [ ./zed ];

  programs.mise.enable = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = "fastfetch";
  };

  home.packages = with pkgs; [
    claude-code
    gh
    clang
    zellij
    zola
    insomnia
    boxbuddy
    fastfetch
  ];
}
