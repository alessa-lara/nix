{
    description = "NixOS configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
        home-manager.url = "github:nix-community/home-manager";
    };

    outputs = inputs@{ nixpkgs, home-manager, ... }: {
        nixosConfigurations = {
            laptop = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./hosts/laptop/hardware-configuration.nix
                    ./hosts/laptop/specific-configuration.nix
                    ./configuration.nix
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.extraSpecialArgs = { inherit inputs; };
                        home-manager.users.lara = ./user.nix;
                    }
                ];
            };

            desktop = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./hosts/desktop/hardware-configuration.nix
                    ./hosts/desktop/specific-configuration.nix
                    ./configuration.nix
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.extraSpecialArgs = { inherit inputs; };
                        home-manager.users.lara = ./user.nix;
                    }
                ];
            };
        };
    };
}
