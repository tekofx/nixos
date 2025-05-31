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

      navi widget fish | source

    '';

    shellAliases = {
      # Docker
      dc = "docker compose";

      # Git
      gc = "git commit -m";
      gs = "git status";
      gp = "git push";

      # Exa
      ls = "exa";
      tree = "exa -T";
    };

    plugins = [{
      name = "forgit";
      src = pkgs.fishPlugins.forgit.src;
    }];
  };
}
