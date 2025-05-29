{ pkgs, inputs, ... }: {

  ## Modules to import
  imports = [
    ../users/teko.nix
    ../users/work.nix

    ../nixos/desktop/gnome.nix
    ../nixos/desktop/cli.nix

  ];

}
