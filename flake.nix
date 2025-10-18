{
  description = "My NixOs Configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
    in {
      nixosConfiguration = {
        desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          inherit specialArgs;

          modules = [
            # import host Configs
            ./hosts/desktop/configuration.nix

            # import common configs
            ./modules/common.nix
            ./modules/home-manager/default.nix
          ];
        };


        notebook = nixpkgs.lib.nixosSystem {
          inherit system;
          inherit specialArgs;

          modules = [
            # import host Configs
            ./hosts/notebook/configuration.nix

            # import common configs
            ./modules/common.nix
            ./modules/home-manager/default.nix
          ];
        };
      };
    };


}
