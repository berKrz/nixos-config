{ pkgs, ... }: {
  programs.bat.enable = true;

  programs.fzf = {
    enable                  = true;
    enableZshIntegration    = true;
    fileWidget.command      = "fd --type f";
    changeDirWidget.command = "fd --type d";
  };

  programs.btop.enable = true;

  programs.fastfetch.enable = true;

  programs.direnv = {
    enable               = true;
    enableZshIntegration = true;
    nix-direnv.enable    = true;
  };

  home.packages = with pkgs; [
    ripgrep
    fd
    zip
    unzip
    glow
    jq
    ffmpeg 
    imagemagick
    pandoc
    tree
    curlie
  ];
}
