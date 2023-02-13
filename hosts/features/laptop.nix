{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [./bluetooth.nix];

  boot.kernelParams = [];

  powerManagement.enable = true;
  services.power-profiles-daemon.enable = true;
}
