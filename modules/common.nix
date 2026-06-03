{ pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.optimise.automatic = true;
  nix.settings.auto-optimise-store = true;

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/Fortaleza";

  programs.fish.enable = true;

  users.users.lucasbrt = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };

  services.openssh.enable = true;

  services.tailscale.enable = true;
  networking.firewall.checkReversePath = "loose";

  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    wget
    yazi
  ];

  system.stateVersion = "26.05";
}
