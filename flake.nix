{
  description = "✨ NixOS config with GNOME & Hyprland + Home Manager (clean & stable)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      hyprland = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/hyprland/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.halozra = import ./home-manager/hosts/halozra-hyprland.nix;
          }
        ];
      };

      gnome = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/gnome/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.halozra = import ./home-manager/hosts/halozra-gnome.nix;
          }
        ];
      };
    };

    homeConfigurations = {
      halozra = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };

        modules = [
          ./home-manager/hosts/halozra-hyprland.nix
        ];

        extraSpecialArgs = {};
      };
    };
  };
}
