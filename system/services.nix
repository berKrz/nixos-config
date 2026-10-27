{ pkgs, ... }: {
  # Audio
  security.rtkit.enable = true; # priority to Pipewire -> avoids audio stuttering

  services.pipewire = {
    enable = true;

    alsa = {
      enable = true;
      support32Bit = true; # for 32 bit games
    };

    pulse.enable = true; # compatibility layer
    wireplumber.enable = true; # session manager
  };

  # Power
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
    evtest
    docker-compose
  ];

  virtualisation.docker.enable = true;

  virtualisation.podman = {
    enable = true;
    defaultNetwork.settings.dns_enabled = true; # dnf inside distrobox container
  };

  virtualisation.containers.containersConf.settings = {
    engine.cdi_spec_dirs = [
      "/run/cdi/"
      "/etc/cdi"
    ];
  };

  services.earlyoom = {
    enable = true;
    freeMemThreshold = 5; # kill when <5% RAM free
    freeSwapThreshold = 10; # kill when <10% swap free
    extraArgs = [
      "--prefer"
      "(wine|steam|proton)"
      "--avoid"
      "(hyprland|noctalia|pipewire|wireplumber)"
    ];
  };
}
