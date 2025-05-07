{ lib, pkgs, config, ... }: {

  home.stateVersion = "24.11";

  imports = [ ./cli/fish.nix ./desktop/gnome.nix ./kitty.nix ./git.nix ];

}
