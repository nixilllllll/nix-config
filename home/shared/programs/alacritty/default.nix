{ ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        padding = {
          x = 15;
          y = 0;
        };
        dynamic_title = false;
      };

      font = {
        size = 12.0;

        normal = {
          family = "JetBrainsMono NFM";
          style = "Bold";
        };
      };

      cursor = {
        style = {
          shape = "Block";
          blinking = "Always";
        };
      };

      keyboard = {
        bindings = [
          {
            key = "ArrowUp";
            mods = "Shift";
            action = "ScrollLineUp";
          }
          {
            key = "ArrowDown";
            mods = "Shift";
            action = "ScrollLineDown";
          }
        ];
      };
    };
  };
}
