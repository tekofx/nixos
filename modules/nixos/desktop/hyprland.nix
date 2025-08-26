{ pkgs, ... }: {

  # Enable hyprland
  services.xserver.displayManager.gdm.wayland = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    #nvidiaPatches = true;
  };

  environment.systemPackages = with pkgs; [
    hyprland
    hyprpaper
    wofi
    hyprpanel
    nerd-fonts.roboto-mono
    grim
    slurp
    wl-clipboard
  ];

}
