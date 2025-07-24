# btop install
{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    finamp
    vlc
    stremio
    spotify

  ];

  services.flatpak.packages =
    [ "io.github.MakovWait.Godots" "app.fotema.Fotema" ];



}
