{
  # services.openssh.enable = true;

  services.udisks2.enable = true;

  security.polkit.enable = true;

  # systemd.user.services.polkit-authentication-agent = {
  #   description = "polkit-authentication-agent";
  #   wantedBy = [ "graphical-session.target" ];
  #   wants = [ "graphical-session.target" ];
  #   after = [ "graphical-session.target" ];
  #   serviceConfig = {
  #     Type = "simple";
  #     ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  #     Restart = "on-failure";
  #     RestartSec = 1;
  #     TimeoutStopSec = 10;
  #   };
  # };
}
