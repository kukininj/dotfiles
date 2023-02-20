{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    # ./fonts.nix
    ./git.nix
    ./neovim.nix
    ./programs.nix
    ./alacritty.nix
    ./misc
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

  home.packages = with pkgs; [
    libreoffice
    keepassxc
    yt-dlp
    mpv
    imv
    nnn
    zip
    unzip
    imagemagick
    ffmpeg
  ];
}