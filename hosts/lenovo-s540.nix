{pkgs, lib, config, ...}: {
  imports = [
    ./shared
    ./features/laptop.nix
    ./features/noto-fonts.nix
    ./features/wayland.nix
    # ./features/flatpak.nix
    # ./features/firewall.nix
    # ./features/gaming.nix
    ./users/lukasz.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = ["xhci_pci" "ahci" "sr_mod" ];
  boot.kernelModules = [  ];

  # fileSystems."/boot" = {
  #   device = "/dev/sda1";
  #   fsType = "vfat";
  # };

  # swapDevices = [
  #   {
  #     device = "/dev/vda2";
  #   }
  # ];

  # fileSystems."/" = {
  #   device = "/dev/vda1";
  #   fsType = "ext4";
  # };

  networking.hostName = "lukasz-s540";

  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces = {
  #   wlp3s0.useDHCP = true;
  #   enp2s0.useDHCP = true;
  # };

  nixpkgs.hostPlatform.system = "x86_64-linux";

  programs = {
    light.enable = true;
    dconf.enable = true;
  };

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  system.stateVersion = "22.11";
}
