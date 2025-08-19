{ pkgs, ... }: {

  nix.settings.trusted-users = [ "root" "teko" ];

  imports = [ ./lang.nix ];

  environment.systemPackages = with pkgs; [
    zed-editor
    android-studio
    vscode
    go
    bruno
    nil
    nerd-fonts.roboto-mono
    devenv
    direnv
  ];

  services.flatpak.packages = [ "io.github.MakovWait.Godots" ];

}
