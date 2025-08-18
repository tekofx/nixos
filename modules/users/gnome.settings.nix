{

  favorite-apps = [
    "firefox.desktop"
    "discord.desktop"
    "org.prismlauncher.PrismLauncher.desktop"
    "anytype.desktop"
    "org.gnome.Nautilus.desktop"
  ];
  app-folders = [ "Desktop" "Utilities" "System" ];
  app-tray = [[
    "Desktop"
    "System"
    "Utilities"
    "steam.desktop"
    "net.lutris.Lutris.desktop"
  ]];

  folders = {

    "org/gnome/desktop/app-folders/folders/Desktop" = {
      apps = [
        "org.gnome.Calculator.desktop"
        "org.gnome.Calendar.desktop"
        "org.gnome.Snapshot.desktop"
        "org.gnome.clocks.desktop"
        "simple-scan.desktop"
        "org.gnome.Evince.desktop"
        "org.gnome.Loupe.desktop"
        "org.gnome.gedit.desktop"
        "vlc.desktop"
        "codium.desktop"
      ];
      name = "Desktop";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/System" = {
      apps = [
        "Alacritty.desktop"
        "org.gnome.DiskUtility.desktop"
        "com.mattjakeman.ExtensionManager.desktop"
        "pavucontrol.desktop"
        "org.gnome.Settings.desktop"
        "org.gnome.SystemMonitor.desktop"
        "org.gnome.tweaks.desktop"
        "vim.desktop"
      ];
      name = "System";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [
        "AnyDesk.desktop"
        "org.gnome.Connections.desktop"
        "org.gnome.DiskUtility.desktop"
        "org.gnome.baobab.desktop"
        "org.gnome.Extensions.desktop"
        "org.gnome.FileRoller.desktop"
        "org.gnome.font-viewer.desktop"
        "de.haeckerfelix.Fragments.desktop"
        "org.gnome.Logs.desktop"
        "cups.desktop"
        "org.gnome.seahorse.Application.desktop"
        "org.gnome.NetworkDisplays.desktop"
      ];
      name = "Utilities";
      translate = false;
    };

  };

}
