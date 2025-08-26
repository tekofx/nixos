{ pkgs, inputs, ... }: {

  ## Configuration
  config = {

    home-manager.useGlobalPkgs = true;
    home-manager.extraSpecialArgs = { inherit inputs; };
    home-manager.backupFileExtension = "back";

    # Define user groups
    users.groups.teko = { };

    # Teko user
    users.users.teko = {
      isNormalUser = true;
      home = "/home/teko";
      group = "teko";
      initialPassword = "12345";
      name = "teko";
      description = "Teko";
      shell = pkgs.fish;
      createHome = true;
      extraGroups = [ "networkmanager" "wheel" "docker" ];
      openssh.authorizedKeys.keys = [ ];
    };
    home-manager.users.teko = import ../home-manager/home-manager.nix;

  };
}
