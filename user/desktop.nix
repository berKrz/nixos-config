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

  xdg.configFile."noctalia/palettes/My Custom Palette.json".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/nixos-config/user/noctalia/palette.json";

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings = builtins.fromTOML (builtins.readFile ./noctalia/config.toml);
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

  home.packages = with pkgs; [
    hyprpicker
    mpvpaper
  ];
}
