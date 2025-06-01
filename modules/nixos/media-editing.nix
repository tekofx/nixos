# btop install
{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [ tenacity obs-studio gimp ];

}
