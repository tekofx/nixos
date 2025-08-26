{ pkgs, lib, config, ... }:
with lib;

let cfg = config.development;
in {

  options.development = {
    android = mkEnableOption "Android packages";
    go = mkEnableOption "Golang packages";
    godot = mkEnableOption "Godot packages";
    java = mkEnableOption "Java packages";
  };

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
    (lib.mkIf cfg.android {
      environment.systemPackages = with pkgs; [ android-studio ];
    })
    (lib.mkIf cfg.go { environment.systemPackages = with pkgs; [ go ]; })
    (lib.mkIf cfg.godot {
      services.flatpak.packages = [ "io.github.MakovWait.Godots" ];
      environment.systemPackages = with pkgs; [ libresprite ];
    })
    (lib.mkIf cfg.java {
      environment.systemPackages = with pkgs; [ jetbrains.idea-community ];
    })
  ];

}
