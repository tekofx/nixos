{ lib, pkgs, config, ... }: {

  programs.zoxide.enable = true;
  programs.navi.enableFishIntegration = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      export FZF_DEFAULT_OPTS="
        --ansi
        --info=inline
        --height=70%
        --layout=reverse 
        --preview-window='right:hidden:wrap:60%'
        --bind='f2:toggle-preview'
        --bind='alt-w:preview-page-up'
        --bind='alt-s:preview-page-down'
        --preview 'bat --color=always --style=header,grid --line-range :300 {}'
      "

    '';

    shellAliases = {
      dc = "docker compose";
      gc = "git commit -m";
      gs = "git status";

    };

    plugins = [{
      name = "forgit";
      src = pkgs.fishPlugins.forgit.src;
    }];
  };
}
