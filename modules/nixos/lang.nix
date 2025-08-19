{ pkgs, lib, config, ... }:
with lib;

let cfg = config.services.langs;

in {

  options.services.langs = { enable = mkEnableOption "hello service"; };
  config = lib.mkIf cfg.enable {

    environment.systemPackages = with pkgs; [ python314 ];
  };

}
