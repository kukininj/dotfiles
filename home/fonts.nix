{
  inputs,
  pkgs,
  ...
}: {
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
