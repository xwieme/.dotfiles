{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./nixos/configuration.nix
      ];
    };

    homeConfiguration = {
      "xander@unknown" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacPackages.x86_64-linux;
        extraSpacialArgs = {inherit inputs;};
        modules = [./home-manager/home.nix];
      };
    };
  };
}
