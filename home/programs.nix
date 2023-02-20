{pkgs, ...}: {
  programs = {
    home-manager.enable = true;
    jq.enable = true;
    fzf.enable = true;
    bat = {
      enable = true;
      config.theme = "base16";
    };
  };
}
