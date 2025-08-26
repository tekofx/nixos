# btop install
{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [ finamp vlc stremio spotify kodi ];

  services.flatpak.packages = [ "app.fotema.Fotema" ];

}
