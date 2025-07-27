{
  description = "NixOS config with GNOME and Hyprland profiles + Home Manager (unstable only)";

  inputs = {
    # Gunakan channel unstable
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Flake utils
    flake-utils.url = "github:numtide/flake-utils";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";

      # pkgs utama
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      ##############################################
      # NixOS Configurations
      ##############################################
      nixosConfigurations = {
        hyprland = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/hyprland/configuration.nix
            home-manager.nixosModules.home-manager

            {
              boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

              environment.systemPackages = with pkgs; [
                # Tambahkan paket global di sini
              ];

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.halozra = import ./home-manager/hosts/halozra-hyprland.nix {
                inherit pkgs;
                config = {};
              };
            }
          ];
        };

        gnome = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/gnome/configuration.nix
            home-manager.nixosModules.home-manager

            {
              boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

              environment.systemPackages = with pkgs; [
                # Tambahkan paket global di sini
              ];

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.halozra = import ./home-manager/hosts/halozra-gnome.nix {
                inherit pkgs;
                config = {};
              };
            }
          ];
        };
      };

      ##############################################
      # Home Manager Standalone
      ##############################################
      homeConfigurations = {
        halozra = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            ./home-manager/hosts/halozra-hyprland.nix
          ];

          extraSpecialArgs = { };
        };
      };
    };
}
