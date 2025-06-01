# btop install
{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    vscodium
    zed-editor
    android-studio
    jetbrains.webstorm
    bruno

  ];

}
