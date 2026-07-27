{ pkgs, config, ... }:
let
  configDir = "${config.home.homeDirectory}/nixos-config";
in {

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    package = null;
    portalPackage = null;
    systemd.enable = false;
  };

  xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink "${configDir}/user/hyprland";

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
  };

  xdg.configFile."noctalia/settings.toml".source = config.lib.file.mkOutOfStoreSymlink "${configDir}/user/noctalia/config.toml";

  services.hyprpolkitagent.enable = true;

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 20;
  };

  home.sessionVariables = {
    HYPRCURSOR_THEME = "Adwaita";
    HYPRCURSOR_SIZE = "20";
  };

}
