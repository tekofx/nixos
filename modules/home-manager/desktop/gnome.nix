{ lib, pkgs, ... }: {

  home.stateVersion = "25.05";

  # Theming
  gtk.enable = true;
  gtk.iconTheme.package = lib.mkForce pkgs.papirus-icon-theme;
  gtk.iconTheme.name = lib.mkForce "Papirus-Dark";
  gtk.cursorTheme.package = lib.mkForce pkgs.bibata-cursors;
  gtk.cursorTheme.name = lib.mkForce "Bibata-Modern-Ice";

  # File associations
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "text/plain" = [ "org.gnome.TextEditor.desktop" ];
      "video/webm" = [ "vlc.desktop" ];
      "video/mp4" = [ "vlc.desktop" ];
      "video/x-matroska" = [ "vlc.desktop" ];
    };
    defaultApplications = {
      "text/plain" = [ "org.gnome.TextEditor.desktop" ];
      "video/webm" = [ "vlc.desktop" ];
      "video/mp4" = [ "vlc.desktop" ];
      "video/x-matroska" = [ "vlc.desktop" ];
    };
  };
  /* xdg.configFile."mimeapps.list" =
     lib.mkIf config.xdg.mimeApps.enable { force = true; };
  */

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-theme = "Bibata-Modern-Ice";
      enable-hot-corners = true;
      icon-theme = "Papirus-Dark";
      show-battery-percentage = true;
    };

    ############################ Workspaces settings ############################
    "org/gnome/shell/app-switcher" = { "current-workspace-only" = true; };
    "org/gnome/mutter" = { "dynamic-workspaces" = true; };

    ############################ Keybindings ############################
    # System keybindings
    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      toggle-fullscreen = [ "F11" ];
    };

    # Interactive screenshot
    "org/gnome/shell/keybindings" = {
      "show-screenshot-ui" = [ "<Shift><Super>s" ];
      "screenshot" = [ "Print" ];
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

    ############################ Gnome Shell ############################
    "org/gnome/shell" = {
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "zen.desktop"
        "kitty.desktop"
        "dev.zed.Zed.desktop"
        "android-studio.desktop"
        "bruno.desktop"
        "org.telegram.desktop.desktop"
        "discord.desktop"
        "spotify.desktop"
      ];

      disable-user-extensions = false;

      enabled-extensions = with pkgs.gnomeExtensions; [
        caffeine.extensionUuid
        auto-move-windows.extensionUuid
        media-controls.extensionUuid
        dash-to-dock.extensionUuid
        bluetooth-battery-meter.extensionUuid
        appindicator.extensionUuid
        vitals.extensionUuid
        tailscale-qs.extensionUuid
        app-grid-wizard.extensionUuid
      ];
    };

    ############################ Extensions config ############################
    "org/gnome/shell/extensions/auto-move-windows" = {
      application-list = [
        "dev.zed.Zed.desktop:1"
        "zen.desktop:2"
        "spotify.desktop:3"
        "bruno.desktop:3"
        "discord.desktop:4"
        "org.telegram.desktop.desktop:4"
      ];

    };
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
