{ ... }: {

  ## Modules to import
  imports = [
    ../nixos/desktop/desktop.nix
    ../nixos/cli/cli.nix

    ../users/teko.nix
    ../users/work.nix

  ];

}
