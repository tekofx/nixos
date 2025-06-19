{ lib, pkgs, config, inputs, ... }: {

  programs.librewolf = {
    enable = true;
    package = pkgs.librewolf;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DontCheckDefaultBrowser = true;
      DisablePocket = true;
      TranslateEnabled = false;
      PasswordManagerEnabled = false;
      DisabledFirefoxAccounts = true;
      DisabledFirefoxStudies = true;
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
        # AutoFXTwitter
        "autofxtwitter@itsrqtl" = {
          install_url =
            "https://addons.mozilla.org/firefox/downloads/latest/autofxtwitter/latest.xpi";
          installation_mode = "force_installed";

        };
        # Bypass Paywalls Clean
        "magnolia@12.34" = {
          install_url =
            "https://gitflic.ru/project/magnolia1234/bpc_uploads/blob/raw?file=bypass_paywalls_clean-4.1.2.0.xpi";
          installation_mode = "force_installed";
        };

        # Sponsorblock
        "sponsorBlocker@ajay.app" = {
          install_url =
            "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
          installation_mode = "force_installed";

        };

        # Youtube anti translate
        "{458160b9-32eb-4f4c-87d1-89ad3bdeb9dc}" = {
          install_url =
            "https://addons.mozilla.org/firefox/downloads/latest/youtube-anti-translate/latest.xpi";
          installation_mode = "force_installed";

        };
      };
      Preferences = {
        # Set DNS Over HTTPS
        "network.trr" = {
          mode = 3;
          uri = "https://cloudflare-dns.com/dns-query";
        };

        # Remove trash from homepage
        "browser.newtabpage.activity-stream" = {
          "feeds.section" = { topstories = false; };
          showSponsoredTopSites = false;
          showSponsored = false;
        };

        # Remove firefox accounts button from toolbar
        "identity.fxaccounts.toolbar.enabled" = false;

        # Remove AI Chat
        "browser.ml.enabled" = false;
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
