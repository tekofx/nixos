{ inputs, ... }: {

  ## Modules to import
  imports = [
    ../users/teko.nix
    ../users/work.nix

    ../nixos/desktop/desktop.nix
    ../nixos/cli/cli.nix
  ];

}
