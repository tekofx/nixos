{ lib, config, ... }: {
  options.gnome = with lib; {
    app-layout = mkOption { type = types.anything; };
  };

  config = let

    layout = config.gnome.app-layout;

    # Function creates dconf compatible app picker entry based on name of app or folder and position.
    apl-entry = with lib.hm.gvariant;
      name:
      (position:
        (mkDictionaryEntry [
          name
          (mkVariant
            [ (mkDictionaryEntry [ "position" (mkVariant position) ]) ])
        ]));

    # Takes a list of lists and converts them to app picker entries
    transformedList = lib.map (innerList:
      lib.zipListsWith (k: p: apl-entry k p) innerList
      (lib.genList (x: x) (lib.length innerList))) layout.app-tray;

  in {

    dconf.settings = {
      "org/gnome/desktop/interface" = { color-scheme = "prefer-dark"; };

      "org/gnome/shell" = {
        favorite-apps = layout.favorite-apps;
        app-picker-layout = transformedList;
      };

      "org/gnome/desktop/app-folders" = {
        folder-children = layout.app-folders;
      };

    } // layout.folders;
  };
}
