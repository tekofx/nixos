{ lib, pkgs, config, ... }: {

  imports = [
    ./desktop/hypr/hyprland.nix
    ./desktop/gnome.nix
    ./kitty.nix
    ./cli/fish.nix
    ./cli/git.nix
  ];

}
