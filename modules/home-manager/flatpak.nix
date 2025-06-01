{ inputs, pkgs, ... }: {

  home.stateVersion = "25.05";
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

  services.flatpak.packages = [ "com.usebottles.bottles" ];

}
