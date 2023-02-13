{
  self,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware.nix
    ./locale.nix
    ./programs.nix
    ./services.nix
    ./environment.nix
    # ./cachix.nix
  ];

  networking.networkmanager.enable = true;

  # nix
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = "nix-command flakes";
}
