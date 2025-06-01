# btop install
{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    steam
    ryujinx
    hydralauncher
    polymc

  ];

}
