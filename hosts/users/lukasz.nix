{pkgs, ...}: {
  users.users.lukasz = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
    ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  
  environment.sessionVariables = rec {
    XDG_CONFIG_HOME = "\${HOME}/.config";
  };

}
