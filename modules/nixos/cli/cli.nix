# btop install
{ config, lib, pkgs, inputs, ... }: {

  programs.fish.enable = true;
  programs.starship.enable = true;

  environment.systemPackages = with pkgs; [
    nixd # Nix language server
    os-prober
    btop
    micro
    git
    vim
    neovim
    navi
    nixfmt-classic
    fish
    starship
    yadm
    zoxide
    fzf
    docker
    fastfetch
    duf
    dua
    yt-dlp
  ];
}
