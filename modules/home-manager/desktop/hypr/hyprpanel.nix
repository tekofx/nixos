{ inputs, pkgs, ... }: {

  home.stateVersion = "25.05";
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {
    enable = true;
    hyprland.enable = true;
    overwrite.enable = true;

    settings = {
      layout = {
        bar = {
          "launcher.icon" = "󱄅";

          clock = { format = "%a %d/%m/%Y  %H:%M"; };

          layouts = {
            "0" = {
              left = [ "dashboard" "workspaces" "separator" "media" ];
              middle = [ ];
              right = [
                "cpu"
                "separator"
                "network"
                "battery"
                "volume"
                "systray"
                "clock"
                "notifications"
              ];
            };
          };
        };
        menus = {
          dashboard = {
            "powermenu.avatar.image" = pkgs.fetchurl {
              url = "https://avatars.githubusercontent.com/u/49290914?v=4";
              sha256 = "QBcliw6ifW3yYqpYibgkVfNxpXUdJPPFtAMN703B+Ik=";
            };
            shortcuts = {
              enabled = true;
              left = {
                shortcut1 = {
                  commmand = "zen";
                  icon = "󰖟";
                  tooltip = "Zen";
                };
                shortcut2 = {
                  commmand = "kitty";
                  icon = "";
                  tooltip = "Kitty";
                };
                shortcut3 = {
                  commmand = "telegram";
                  icon = "";
                  tooltip = "Telegram";
                };
                shortcut4 = {
                  commmand = "spotify";
                  icon = "";
                  tooltip = "Spotify";
                };
              };
            };
          };
          clock = {
            time = { military = true; };

          };
        };

        theme = {
          bar = {
            transparent = true;
            outer_spacing = "0em";
            buttons = {
              padding_y = "0em";
              y_margins = "0.2em";
              separator = {
                width = "0em";
                margins = "0.3em";
              };
            };
            "menus.menu.dashboard.profile.radius" = "10em";
          };
          "font.size" = "1rem";
        };

      };
    };
  };

}
