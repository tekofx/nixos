# btop install
{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    finamp
    vlc
    stremio
    spotify
  ];


}
