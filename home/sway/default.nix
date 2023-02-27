{
  pkgs,
  lib,
  config,
  ...
}: {

  imports = [
    ./../waybar.nix
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
    config = null;
    # config = rec {
    #   menu = "bemenu-run";
    #   bars = []; # can be empty, waybar is run with systemd
    #   modifier = "Mod4";
    #   terminal = "alacritty"; 
    #   startup = [
    #     # Launch Firefox on start
    #     {command = "firefox";}
    #   ];

    #   floating = {
    #     criteria = [];
    #   };
    # };
  };
  xdg.configFile."sway/config".source = lib.mkForce ./config;
}
