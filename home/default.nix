{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./git.nix
    ./editors
    ./programs.nix
    ./alacritty.nix
    ./sway
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
    };

    file."Wallpapers".source = ./wallpapers;
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
