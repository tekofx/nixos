{ lib, pkgs, config, home-manager, ... }: {

  home.stateVersion = "25.05";

  imports = [
    ./desktop/hypr/hyprland.nix
    ./desktop/gnome.nix
    ./kitty.nix
    ./cli/fish.nix
    ./cli/git.nix
  ];

}
