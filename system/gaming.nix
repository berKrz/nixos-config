{ pkgs, ... }: {
  # Launchers
  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  environment.systemPackages = [
    (pkgs.heroic.override {
      extraPkgs = ps: [
        ps.gamemode
        ps.gamescope
      ];
    })
  ];

  # Performance / compositing
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;

  # Controllers
  hardware.steam-hardware.enable = true;
  services.udev.packages = [ pkgs.game-devices-udev-rules ];
}
