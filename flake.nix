{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Zen Browser
    zen-browser.url = "github:youwen5/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    # Hyprpanel
    hyprpanel.url = "github:jas-singhfsu/hyprpanel";
    hyprpanel.inputs.nixpkgs.follows = "nixpkgs";

    # Stylix
    stylix.url = "github:danth/stylix/release-24.11";

  };

  outputs = { self, nixpkgs, stylix, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        # Stylix
        stylix.homeManagerModules.stylix
        stylix.nixosModules.stylix

        ./configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
