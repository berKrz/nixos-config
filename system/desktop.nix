{ pkgs, ... }: {
  # Auth daemon
  security.polkit.enable = true;
  
  # Settings DB used for GNOME apps
  programs.dconf.enable = true;
  
  services.gnome.gnome-keyring.enable = true;
  
  # Two backends are necessary for wlroots compositors
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk # file picker, app chooser etc. 
      pkgs.xdg-desktop-portal-hyprland # screen sharing, screen shots
    ];
    config.common = {
      default = "gtk";
      "org.freedesktop.impl.portal.ScreenCast" = "hyprland";
      "org.freedesktop.impl.portal.Screenshot" = "hyprland";
    };
  };
  
  # Wayland env vars
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    GDK_BACKEND = "wayland"; 
  };
  
  programs.hyprland.enable = true;
  
  programs.noctalia-greeter.enable = true;
}
