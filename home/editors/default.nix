{pkgs, ...}: {
  imports = [ ./helix.nix ./neovim.nix ];
  home.packages = with pkgs; [
    nil
    clang-tools
    rust-analyzer
  ];
}