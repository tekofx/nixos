# btop install
{ config, lib, pkgs, inputs, ... }: {

  environment.systemPackages = with pkgs; [
    vscodium
    kitty
    zed-editor
    telegram-desktop
    discord
    spotify
    steam
    android-studio
    jetbrains.webstorm
    bruno
    qbittorrent
    inputs.zen-browser.packages.${system}.default
    vlc
    obs-studio

    # Hyprland
    hyprland
    hyprpaper
    wofi
    hyprpanel
    nerd-fonts.roboto-mono
    grim
    slurp
    wl-clipboard
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

}
