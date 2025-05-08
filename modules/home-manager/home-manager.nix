{ lib, pkgs, config, ... }: {

  home.stateVersion = "24.11";

  imports = [
    ./desktop/hypr/hyprland.nix
    ./cli/fish.nix
    ./desktop/gnome.nix
    ./kitty.nix
    ./git.nix
  ];

}
