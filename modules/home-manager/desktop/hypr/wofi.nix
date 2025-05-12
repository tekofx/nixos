{ ... }: {
  programs.wofi = {
    style = ''
      * {
          font-family: monospace;
      }

      window {
         background-color: #282a36;
      }
    '';
  };
}
