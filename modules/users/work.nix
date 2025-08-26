{ pkgs, inputs, ... }: {

  ## Modules to import
  imports = [ ../nixos/development.nix ];

  ## Configuration
  config = {
    home-manager.useGlobalPkgs = true;
    home-manager.extraSpecialArgs = { inherit inputs; };
    home-manager.backupFileExtension = "back";

    # Define user groups
    users.groups.work = { };

    # Work user
    users.users.work = {
      isNormalUser = true;
      home = "/home/work";

      group = "work";
      initialPassword = "12345";
      name = "work";
      description = "Work";
      shell = pkgs.fish;
      createHome = true;
      extraGroups = [ "networkmanager" "wheel" "docker" ];
      openssh.authorizedKeys.keys = [ ];
    };
    home-manager.users.work = import ../home-manager/home-manager.nix;

  };
}
