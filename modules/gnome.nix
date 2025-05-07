{ lib, pkgs, environment, ... }: {

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    yelp
    xterm
    epiphany
    geary
    gnome-console
    yelp
  ];

  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.media-controls
    gnomeExtensions.dash-to-dock
    gnomeExtensions.caffeine
    gnomeExtensions.bluetooth-battery-meter
    gnomeExtensions.appindicator
    gnomeExtensions.vitals
    gnome-tweaks
  ];

}
