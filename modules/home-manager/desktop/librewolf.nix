{ lib, pkgs, config, inputs, ... }: {

  programs.librewolf = {
    enable = true;
    package = pkgs.librewolf;
    policies = {
      ExtensionSettings = {
        "*".installation_mode =
          "blocked"; # blocks all addons except the ones specified below
        # uBlock Origin:
        "uBlock0@raymondhill.net" = {
          install_url =
            "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        # Privacy Badger:
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          install_url =
            "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
          installation_mode = "force_installed";
        };
        # Bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url =
            "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
    profiles.teko = {
      search = {
        force = true;
        default = "brave";
        privateDefault = "ddg";
        order = [ "brave" "ddg" "google" ];
        engines = {
          brave = {
            name = "Brave Search";
            urls = [{
              template = "https://search.brave.com/search?q={searchTerms}";
            }];
            icon =
              "https://cdn.search.brave.com/serp/v3/_app/immutable/assets/favicon.acxxetWH.ico";
          };
          bing.metaData.hidden = true;
        };
      };
      bookmarks = { };
    };
  };
}
