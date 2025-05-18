{ lib, pkgs, config, ... }: {

  home.stateVersion = "24.11";

  # Theming
  gtk.enable = true;
  gtk.iconTheme.package = lib.mkForce pkgs.papirus-icon-theme;
  gtk.iconTheme.name = lib.mkForce "Papirus-Dark";
  gtk.cursorTheme.package = lib.mkForce pkgs.bibata-cursors;
  gtk.cursorTheme.name = lib.mkForce "Bibata-Modern-Ice";

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-theme = "Bibata-Modern-Ice";
      enable-hot-corners = true;
      icon-theme = "Papirus-Dark";
      show-battery-percentage = true;
    };

    # System keybindings
    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
    };

    # Custom Keybindings
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/kitty/"

      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/kitty" = {
      binding = "<Primary><Alt>t";
      command = "kitty";
      name = "Open Kitty";
    };

    "org/gnome/shell" = {
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "zen.desktop"
        "kitty.desktop"
        "android-studio.desktop"
        "codium.desktop"
        "webstorm.desktop"
        "bruno.desktop"
        "org.telegram.desktop.desktop"
        "discord.desktop"
        "spotify.desktop"
      ];

      disable-user-extensions = false;

      enabled-extensions = with pkgs.gnomeExtensions; [
        caffeine.extensionUuid
        media-controls.extensionUuid
        dash-to-dock.extensionUuid
        bluetooth-battery-meter.extensionUuid
        appindicator.extensionUuid
        vitals.extensionUuid
      ];
    };

    ## Extensions config
    "org/gnome/shell/extensions/mediacontrols" = {
      elements-order = [ "ICON" "CONTROLS" "LABEL" ];
      show-control-icons-seek-backward = false;
      show-control-icons-seek-forward = false;
      extension-index = lib.gvariant.mkUint32 1;
      extension-position = "Left";
    };

    "org/gnome/shell/extensions/vitals" = {
      hot-sensors =
        lib.gvariant.mkArray [ "_memory_usage_" "__temperature_avg__" ];
      show-fan = false;
      show-network = false;
      show-processor = false;
      show-storage = false;
      show-voltage = false;
    };
    "org/gnome/shell/extensions/dash-to-dock" = {
      hot-keys = false;
      show-trash = false;
    };

  };

}
