{
  self,
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    self.homeManagerModules
    ./xdg.nix
    ./programs
  ];

  home = {
    username = "lukasz";
    homeDirectory = "/home/lukasz";
    stateVersion = "22.11";

    sessionVariables = {
      PATH = lib.makeBinPath [
        "$PATH"
        "$HOME/.local/bin"
        "$HOME/.bin"
      ];
      EDITOR = "hx";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
  };
}
