{ inputs, ... }: {
  imports = [
    inputs.noctalia.homeModules.default
    ./shell.nix
    ./terminal.nix
    ./desktop.nix
    ./dev.nix
    ./browsers.nix
    ./gnome.nix
    ./gui.nix
    ./tui.nix
    ./gaming.nix
    ./editor.nix
  ];

  home.stateVersion = "26.05";
}
