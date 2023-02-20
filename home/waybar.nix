{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = [{
      layer = "bottom";
      position = "bottom";
      height = 28;

      modules-left = ["custom/bemenu" "sway/workspaces" "sway/mode" "sway/window"];
      modules-right = ["custom/spotify" "custom/previous" "custom/play" "custom/next" "cpu" "custom/gpu-usage" "memory" "custom/weather" "custom/storage" "backlight" "pulseaudio" "idle_inhibitor" "battery" "clock" "custom/pacman" "tray" "custom/notification"];
        
      "sway/mode" = {
        format = " {}";
      };
      "sway/workspaces" = {
          format = "{name}";
          disable-scroll = true;
      };
      "sway/window" = {
          max-length = 80;
          tooltip = false;
      };
      cpu = {
          format = "{usage}% ";
          tooltip = false;
          interval = 3;
      };
    }];
  };
}