{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Zen Browser
    zen-browser.url = "github:youwen5/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    # Stylix
    stylix.url = "github:danth/stylix/release-25.05";


    # Poly MC
    polymc.url = "github:PolyMC/PolyMC";

    # Nix-flatpak
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

  };

  outputs = { self, nixpkgs, stylix, ... }@inputs: {
    nixosConfigurations = {
      lenovo = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [

          ./modules/hosts/lenovo/lenovo.nix

          # Global settings
          ./modules/global.nix

          # Home manager
          inputs.home-manager.nixosModules.default

          { nixpkgs.overlays = [ inputs.polymc.overlay ]; }
        ];
      };

      vaio = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./modules/hosts/vaio/vaio.nix

          # Global settings
          ./modules/global.nix

          # Home manager
          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}
