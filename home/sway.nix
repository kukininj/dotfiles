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
    waybar
  ];

  wayland.windowManager.sway = {
    enable = true;
    systemdIntegration = true;
    config = rec {
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
