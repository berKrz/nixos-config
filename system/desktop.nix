{ pkgs, inputs, ... }: {
  # Auth daemon
  security.polkit.enable = true;
  
  # Settings DB used for GNOME apps
  programs.dconf.enable = true;
  
  services.gnome.gnome-keyring.enable = true;
  
  # Two backends are necessary for wlroots compositors
  xdg.portal = {
    enable = true;
    wlr.enable = true; # for screen sharing and screenshots
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; # file picker, app chooser etc. 
    config.common = {
      default = "gtk";
      "org.freedesktop.impl.portal.ScreenCast" = "wlr";
      "org.freedesktop.impl.portal.Screenshot" = "wlr";
    };
  };
  
  # Wayland env vars
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    GDK_BACKEND = "wayland"; 
    WLR_NO_HARDWARE_CURSORS = "1";
  };
  
  programs.mango.enable = true;
  
  # Noctalia shell
  environment.systemPackages = [
    pkgs.polkit_gnome
  ];
  
  programs.noctalia-greeter.enable = true;
}
