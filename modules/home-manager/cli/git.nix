{ lib, pkgs, config, ... }: {

  programs.git = {
    enable = true;
    userName = "tekofx";
    userEmail = "tekofxx@gmail.com";
    extraConfig.init.defaultBranch = "main";
  };
}
