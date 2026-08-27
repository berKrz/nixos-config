{ pkgs, ... }: {
  home.packages = with pkgs; [
    onlyoffice-desktopeditors
    vlc
    stremio-linux-shell
  ];

  programs.obs-studio = {
    enable = true;

    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture # audio per app
      obs-vaapi                  # amd hw video encoding
      obs-vkcapture              # vulkan/opengl capture
    ];
  };
}
