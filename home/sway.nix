{
  pkgs,
  lib,
  config,
  ...
}: {

  imports = [
    ./waybar.nix
  ];
  
  home.sessionVariables = {
    
  };

  home.packages = with pkgs; [
    alacritty
    bemenu
  ];

  wayland.windowManager.sway = {
    enable = true;
    systemdIntegration = true;
    config = rec {
      menu = "bemenu-run";
      bars = [];
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "alacritty"; 
      startup = [
        # Launch Firefox on start
        {command = "firefox";}
      ];
    };
  };
}
