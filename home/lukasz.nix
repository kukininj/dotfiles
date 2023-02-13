{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./shared

    # ./features/helix

    # ./features/vscode
    # ./features/vscode/minimal.nix
  ];

  home.packages = with pkgs; [
    libreoffice
  ];

  fontProfiles = {
    regular = {
      family = "JetBrains Mono";
      package = pkgs.jetbrains-mono;
    };

    monospace = {
      family = "JetBrainsMono Nerd Font";
      package = pkgs.nerdfonts.override {
        fonts = ["JetBrainsMono"];
      };
    };
  };
}
