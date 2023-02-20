{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
in {
  config = {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
      jetbrains-mono
      nerdfonts
    ];

    gtk.font.name = "JetBrains Mono";
  };
}
