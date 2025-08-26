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
  ];
  services.flatpak.packages =
    [ "com.usebottles.bottles" "io.github.brunofin.Cohesion" ];

}
