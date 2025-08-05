# btop install
{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    zed-editor
    android-studio
    bruno
    nil
    nerd-fonts.roboto-mono
    devenv
    direnv

  ];

  services.flatpak.packages =
    [ "io.github.MakovWait.Godots" ];

}
