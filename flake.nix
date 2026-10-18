{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    happ-nix.url = "github:DaHL-gh/happ-nix";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };

      mkHost =
        hostName:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit pkgs-unstable inputs; };
          modules = [
            ./hosts/${hostName}/configuration.nix
            home-manager.nixosModules.home-manager
            inputs.happ-nix.nixosModules.default
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit pkgs-unstable; };
              home-manager.users.xbscure = import ./home;
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        nomad = mkHost "nomad";
        lab-rat = mkHost "lab-rat";
      };
    };
}
