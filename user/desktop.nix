{ pkgs, config, ... }:
let
  configDir = "${config.home.homeDirectory}/nixos-config";
in
{

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    package = null;
    portalPackage = null;
    systemd.enable = true;

    extraConfig = builtins.readFile ./hyprland/hyprland.lua;
  };

  # individual symlinks
  xdg.configFile."hypr/binds.lua".source =
    config.lib.file.mkOutOfStoreSymlink "${configDir}/user/hyprland/binds.lua";
  xdg.configFile."hypr/input.lua".source =
    config.lib.file.mkOutOfStoreSymlink "${configDir}/user/hyprland/input.lua";
  xdg.configFile."hypr/rules.lua".source =
    config.lib.file.mkOutOfStoreSymlink "${configDir}/user/hyprland/rules.lua";
  xdg.configFile."hypr/visuals.lua".source =
    config.lib.file.mkOutOfStoreSymlink "${configDir}/user/hyprland/visuals.lua";
  xdg.configFile."hypr/noctalia.lua".source =
    config.lib.file.mkOutOfStoreSymlink "${configDir}/user/hyprland/noctalia.lua";

  xdg.configFile."noctalia/palettes/My Custom Palette.json".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/user/noctalia/palette.json";

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings = builtins.fromTOML (builtins.readFile ./noctalia/config.toml);
  };

  xdg.configFile."noctalia/settings.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${configDir}/user/noctalia/config.toml";

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
