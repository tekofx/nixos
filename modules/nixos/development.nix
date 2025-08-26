{ pkgs, lib, config, ... }:
with lib;

let
  settings = import ../config/settings.nix;
  dev = settings.development;

in {

  config = lib.mkMerge [
    {
      nix.settings.trusted-users = [ "root" "teko" ];
      environment.systemPackages = with pkgs; [
        nerd-fonts.roboto-mono
        zed-editor
        nil
        bruno
      ];
    }
    (lib.mkIf dev.enableAndroid {
      environment.systemPackages = with pkgs; [ android-studio ];
    })
    (lib.mkIf dev.enableGo { environment.systemPackages = with pkgs; [ go ]; })
    (lib.mkIf dev.enableGodot {
      services.flatpak.packages = [ "io.github.MakovWait.Godots" ];
      environment.systemPackages = with pkgs; [ libresprite ];
    })
    (lib.mkIf dev.enableJava {
      environment.systemPackages = with pkgs; [ jetbrains.idea-community ];
    })
  ];

}
