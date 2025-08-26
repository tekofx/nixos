# btop install
{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    qbittorrent
    inputs.zen-browser.packages.${system}.default
    calibre
    librewolf
    carburetor
    gradia
    eyedropper
    qmapshack
    obsidian
  ];
}
