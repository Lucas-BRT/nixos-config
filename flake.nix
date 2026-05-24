{
  description = "My NixOs Configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      specialArgs = { inherit inputs pkgs-unstable; };

      mkHost = hostPath: nixpkgs.lib.nixosSystem {
       	inherit system specialArgs;
       	modules = [
       	  hostPath
       	  ./modules/common.nix
       	  ./modules/home-manager/default.nix
       	];
      };

    in {
      nixosConfigurations = {
        vivobook-s14 = mkHost ./hosts/vivobook-s14/configuration.nix;
      };
    };
}
