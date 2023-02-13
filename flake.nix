{
  description = "Lukasz NixOS config";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;

    # flakes
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    eachSupportedSystem = nixpkgs.lib.genAttrs [
      "x86_64-linux"
    ];

    legacyPackages = eachSupportedSystem (system:
      import nixpkgs {
        inherit system;
        config = {allowUnfree = true;};
      });

    lib = nixpkgs.lib;
    # mkHost = nixpkgs.lib.nixosSystem;
    mkHome = home-manager.lib.homeManagerConfiguration;
  in {
    homeManagerModules = import ./modules/home-manager;
    nixosModules = import ./modules/host;

    devShells = eachSupportedSystem (system: {
      default = import ./shell.nix {pkgs = legacyPackages.${system};};
    });

    formatter = eachSupportedSystem (system: legacyPackages.${system}.alejandra);

    nixosConfigurations = {
      # lenovo-s540 = lib.nixosSystem {
      #   pkgs = legacyPackages.x86_64-linux;
      #   modules = [./hosts/lenovo-s540.nix];
      #   specialArgs = {inherit self inputs;};
      # };
      qemu-vm = lib.nixosSystem {
        pkgs = legacyPackages.x86_64-linux;
        modules = [./hosts/qemu-vm.nix];
        specialArgs = {inherit self inputs;};
      };
    };

    homeConfigurations."lukasz" = mkHome {
      pkgs = self.outputs.nixosConfigurations.qemu-vm.pkgs;
      modules = [./home/lukasz.nix];
      extraSpecialArgs = {inherit self inputs;};
    };
  };
}
