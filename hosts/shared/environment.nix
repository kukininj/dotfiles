{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    exfat
    ntfs3g
    nnn
    htop
    helix
    neovim
    file
  ];
}
