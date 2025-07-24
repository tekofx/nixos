# btop install
{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    zed-editor
    android-studio
    jetbrains.webstorm
    bruno

    nil

  ];

  services.flatpak.packages =
    [ "io.github.MakovWait.Godots" "com.github.finefindus.eyedropper" ];

}
