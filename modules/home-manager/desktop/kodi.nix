{ lib, pkgs, config, inputs, ... }: {
  environment.systemPackages =
    [ (pkgs.kodi.withPackages (kodiPkgs: with kodiPkgs; [ jellyfin ])) ];
}
