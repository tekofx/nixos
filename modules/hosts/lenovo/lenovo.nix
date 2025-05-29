# Slimbook executive 16 custom configuration
{ pkgs, lib, config, inputs, home-manager, ... }: {

  ## Configuration
  config = {

    ## System state version
    system.stateVersion = "25.05";

    # Allow experimental features
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Allow unfree software
    nixpkgs.config.allowUnfree = true;

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Hostname
    networking.hostName = "lenovo";

    # Enable networking
    networking.networkmanager.enable = true;

    # Exclude xterm
    services.xserver.excludePackages = [ pkgs.xterm ];

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

  };

  ## Modules to import
  imports = [
    ./hardware.nix
    ./power-management.nix

    # Imported shared modules
    ../../profiles/workstation.nix
  ];
}
