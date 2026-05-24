{ pkgs, ... }:

{
  fonts.packages = [ pkgs.nerd-fonts.fira-code ];

  environment.systemPackages = with pkgs; [
    openssl
    pkg-config
    neovim
  ];

  environment.variables = {
    PKG_CONFIG_PATH = [ "${pkgs.openssl.dev}/lib/pkgconfig" ];
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      zlib
      openssl
    ];
  };

  virtualisation.docker.enable = true;
  users.users.lucasbrt.extraGroups = [ "docker" ];
}
