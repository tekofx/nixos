{ pkgs, lib, ... }:

{
  programs.zed-editor = {
    enable = true;

    ## This populates the userSettings "auto_install_extensions"
    extensions = [ "nix" "toml" "elixir" "make" "dockerfile" "docker compose" ];

    userSettings = {

      telemetry = {
        metrics = false;
        diagnostics = false;
      };
      #ui_font_size = 16;
      # buffer_font_size = 14;

      autosave = "on_focus_change";
      format_on_save = "on";
      collaboration_panel = { button = false; };
    };

    userKeymaps = [
      {
        context = "Workspace";
        bindings = {
          "shift shift" = "file_finder::Toggle";
          "ctrl ctrl" = "command_palette::Toggle";
          "ctrl-shift-a" = "editor::ToggleComments";
        };
      }
      {
        context = "Editor && vim_mode == insert && !menu";
        bindings = { };
      }
    ];

  };
}
