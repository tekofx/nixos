{ lib, pkgs, config, ... }: {

  programs.zoxide.enable = true;
  programs.navi.enableFishIntegration = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';

    shellAliases = {
      dc = "docker compose";
      gc = "git commit -m";

    };

    plugins = [{
      name = "forgit";
      src = pkgs.fishPlugins.forgit.src;
    }];
  };
}
