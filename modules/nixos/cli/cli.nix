# btop install
{ config, lib, pkgs, inputs, ... }: {

  programs.fish.enable = true;
  programs.starship.enable = true;
  services.tailscale.enable = true;
  #system.activationScripts.script.text = "tailscale --set owner=teko";

  environment.systemPackages = with pkgs; [
    nixd # Nix language server
    xdg-desktop-portal-gtk
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
    eza
    jq
    rm-improved

  ];
}
