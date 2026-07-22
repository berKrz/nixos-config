{ pkgs, ... }: {
  home.packages = with pkgs; [
    onlyoffice-desktopeditors
    vlc
    stremio-linux-shell
  ];
}
