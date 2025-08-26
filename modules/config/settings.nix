# config/settings.nix
{
  username = "teko";
  hostName = "nixbook";

  # Feature flags
  enableAndroid = true;
  enableGo = true;
  enableJava = false;
  enableGodot = true;

  # Other shared values
  defaultEditor = "zed";
  useNerdFonts = true;
}
