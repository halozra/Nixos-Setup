{
  description = "NixOS config with GNOME and Hyprland profiles + Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgsStable = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgsUnstable = import nixpkgs-unstable { inherit system; };
    in
    {
      nixosConfigurations = {
        hyprland = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/hyprland/configuration.nix
            home-manager.nixosModules.home-manager
            {
              nixpkgs.overlays = [
                (final: prev: {
                  unstable = pkgsUnstable;
                })
              ];

              home-manager.users.halozra = import ./home-manager/hosts/halozra.nix{
                config = {};      # sesuaikan sesuai kebutuhan
                pkgs = pkgsStable;
             };


              boot.kernelPackages = pkgsUnstable.linuxPackages_xanmod_latest;
              environment.systemPackages = with pkgsUnstable; [
              ];

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
            }
          ];
        };

        gnome = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/gnome/configuration.nix
            home-manager.nixosModules.home-manager
            {
              nixpkgs.overlays = [
                (final: prev: {
                  unstable = pkgsUnstable;
                })
              ];

              home-manager.users.halozra = import ./home-manager/hosts/halozra.nix{
              config = {};      # sesuaikan sesuai kebutuhan
              pkgs = pkgsStable;
              };


              boot.kernelPackages = pkgsUnstable.linuxPackages_xanmod_latest;
              environment.systemPackages = with pkgsUnstable; [

              ];

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
            }
          ];
        };
      };
    };
}
