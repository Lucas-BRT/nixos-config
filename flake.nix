{
  description = "My NixOs Configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };

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
