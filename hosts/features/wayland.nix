{pkgs, ...}: {
  services.pipewire = {
    enable = true;
    pulse.enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  programs.sway.enable = true;

  services.xserver = {
    enable = true;
    displayManager = {
      gdm.wayland = true;
      # session = [
      #   {
      #     manage = "desktop";
      #     name = "sway";
      #     start = ''exec $HOME/.wayland-session'';
      #   }
      # ];
    };
  };

  security.rtkit.enable = true;
  security.pam.services.swaylock = {};

  hardware.pulseaudio.enable = false;

  environment.systemPackages = with pkgs; [
    qt5.qtwayland
    qt6.qtwayland
  ];
}
