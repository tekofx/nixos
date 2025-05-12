{ lib, pkgs, config, ... }: {

  programs.stylix = { targets.btop.enable = true; };
}
