{
  description = "My NixOS config with Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }: let
    system = "x86_64-linux";

    pkgsUnstable = import nixpkgs-unstable {
      inherit system;
    };
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager

          {
            nixpkgs.overlays = [
              (final: prev: {
                unstable = pkgsUnstable;
              })
            ];

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";

            home-manager.users.halozra = import ./home-manager/hosts/halozra.nix;

            boot.kernelPackages = pkgsUnstable.linuxPackages_zen;

            environment.systemPackages = with pkgsUnstable; [
            ];
          }
        ];

        specialArgs = {
          pkgsUnstable = pkgsUnstable;
        };
      };
    };
  };
}
