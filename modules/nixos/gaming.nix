# btop install
{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    steam
    ryujinx
    hydralauncher
    polymc
  ];

  services.flatpak.packages = [ "org.vinegarhq.Sober" "page.kramo.Cartridges" ];

}
