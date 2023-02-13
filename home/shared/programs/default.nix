{pkgs, ...}: {
  imports = [
    ./git.nix
    ./neovim.nix
  ];

  home.packages = with pkgs; [
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

  programs = {
    home-manager.enable = true;
    jq.enable = true;
    fzf.enable = true;
    bat = {
      enable = true;
      config.theme = "base16";
    };
    exa = {
      enable = true;
      enableAliases = true;
    };
  };
}
