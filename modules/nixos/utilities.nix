# btop install
{ pkgs, inputs, ... }: {

  environment.systemPackages = with pkgs; [
    kitty
    qbittorrent
    inputs.zen-browser.packages.${system}.default
    calibre
    librewolf
    carburetor
    gradia
    eyedropper
    qmapshack
    obsidian
    localsend
    pika-backup
    bottles
  ];
  services.flatpak.packages = [ "io.github.brunofin.Cohesion" ];

}
