# btop install
{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    vscodium
    zed-editor
    android-studio
    jetbrains.webstorm
    bruno

  ];

  services.flatpak.packages =
    [ "io.github.MakovWait.Godots" "com.github.finefindus.eyedropper" ];

}
