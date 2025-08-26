# btop install
{ pkgs, ... }: {

  environment.systemPackages = with pkgs;
    [
      finamp
      vlc
      stremio
      spotify
      # Regular kodi is replaced by the custom one below
    ] ++ [
      # Custom Kodi with Jellyfin plugin
      (pkgs.kodi.withPackages
        (kodiPkgs: with kodiPkgs; [ jellyfin pvr-iptvsimple ]))
    ];
  services.flatpak.packages = [ "app.fotema.Fotema" ];

}
