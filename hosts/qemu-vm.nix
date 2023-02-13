{pkgs, lib, config, ...}: {
  imports = [
    ./shared
    ./features/noto-fonts.nix
    ./features/wayland.nix
    ./users/lukasz.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = ["xhci_pci" "ahci" "sr_mod" "virtio_pci" "virtio_blk" ];
  boot.kernelModules = [ "kvm-amd" ];

  swapDevices = [
    {
      device = "/dev/vda2";
    }
  ];

  fileSystems."/" = {
    device = "/dev/vda1";
    fsType = "ext4";
  };

  boot.loader = {
    grub = {
      enable = true;
      device = "/dev/vda";
      useOSProber = true;
    };
  };

  networking.hostName = "qemu-vm";

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform.system = "x86_64-linux";

  programs = {
    dconf.enable = true;
  };

  system.stateVersion = "22.11";
}
