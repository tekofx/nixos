# btop install
{ config, lib, pkgs, inputs, ... }: {
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
