{ lib, pkgs, environment, ... }: {

  # Enable hyprland
  services.xserver.displayManager.gdm.wayland = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    #nvidiaPatches = true;
  };

}
