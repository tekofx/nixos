{ pkgs, ... }: {

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "es";
    variant = "winkeys";
  };

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
    gnomeExtensions.auto-move-windows
    gnomeExtensions.vitals
    gnomeExtensions.tailscale-qs
    gnome-tweaks
    gnomeExtensions.app-grid-wizard
  ];

}
