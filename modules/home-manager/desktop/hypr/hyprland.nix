{ ... }: {

  home.stateVersion = "24.11";

  imports = [

    ./hyprpanel.nix 
    ./wofi.nix
  ];

}
