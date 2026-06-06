{
  description = "✨ NixOS config with GNOME & Hyprland + Home Manager (clean & stable)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  # PERBAIKAN 1: Tambahkan @inputs di sini untuk menangkap scope input luar
  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      
      # --- Profil 1: Hyprland ---
      hyprland = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/hyprland/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            # PERBAIKAN 2: Oper inputs agar bisa dibaca di dalam file .nix sub-folder
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.halozra = import ./home-manager/hosts/halozra-hyprland.nix;
          }
        ];
      };

      # --- Profil 2: GNOME ---
      gnome = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/gnome/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.halozra = import ./home-manager/hosts/halozra-gnome.nix;
          }
        ];
      };
    };
      kde = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/kde/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              # PERBAIKAN 2: Oper inputs agar bisa dibaca di dalam file .nix sub-folder
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.halozra = import ./home-manager/hosts/halozra-kde.nix;
            }
          ];
        };
    
    # PERBAIKAN 3: Blok homeConfigurations standalone yang redundan telah DIHAPUS 
    # karena manajemen user sudah dihandle penuh di dalam nixosConfigurations di atas.
  };
}