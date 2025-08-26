# btop install
{ pkgs, inputs, ... }: {

  # Stylix
  stylix = {
    enable = true;
    autoEnable = true;
    image = pkgs.fetchurl {
      url = "https://techraptor.net/sites/default/files/2021-11/Mistborn.jpg";
      sha256 = "4atLVJGjiNongRduH7U8DqcalaM2BS65Roqrfs1CZbU=";
    };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
  };

  # Enable flatpak
  services.flatpak.enable = true;

  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
    # Stylix
    inputs.stylix.nixosModules.stylix

    # Desktop environments
    ./gnome.nix
    ./hyprland.nix

    # Desktop programs
    ../gaming.nix
    ../communication.nix
    ../development.nix
    ../media-editing.nix
    ../multimedia.nix
    ../utilities.nix
  ];

}
