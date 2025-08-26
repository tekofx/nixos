# btop install
{ pkgs, inputs, ... }: {

  environment.systemPackages = with pkgs; [
    kitty
    qbittorrent
    inputs.zen-browser.packages.${system}.default
    calibre
    librewolf
    carburetor
    gradia
    eyedropper
    qmapshack
    obsidian
  ];

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
  services.flatpak.packages =
    [ "com.usebottles.bottles" "io.github.brunofin.Cohesion" ];

  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
    # Stylix
    inputs.stylix.nixosModules.stylix

    # Desktop environments
    ./gnome.nix
    ./hyprland.nix

    # Desktop programs
    ../gaming.nix
    ../communucation.nix
    ../development.nix
    ../media-editing.nix
    ../multimedia.nix
    ../utilies.nix
  ];

}
