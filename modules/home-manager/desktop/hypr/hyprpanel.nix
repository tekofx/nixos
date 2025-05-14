{ inputs, ... }: {

  home.stateVersion = "24.11";
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {
    enable = true;
    hyprland.enable = true;
    overwrite.enable = true;

    settings = {
      layout = {
        bar = {
          clock = { format = "%a %d/%m/%Y  %H:%M"; };

          layouts = {
            "0" = {
              left = [ "dashboard" "workspaces" ];
              middle = [ "media" ];
              right = [
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
        };
        theme = {
          bar = {
            transparent = true;
            outer_spacing = "0em";
            buttons = {
              padding_y = "0em";
              y_margins = "0.2em";
            };
          };
        };
      };
    };
  };

}
