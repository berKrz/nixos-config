{ pkgs, ... }: {
  programs.bat = {
    enable = true;
    extraPackages = [
      pkgs.bat-extras.batman
      pkgs.bat-extras.batdiff
    ];
  };

  programs.fzf = {
    enable                  = true;
    enableZshIntegration    = true;
    fileWidget.command      = "fd --type f";
    changeDirWidget.command = "fd --type d";
  };

  programs.direnv = {
    enable               = true;
    enableZshIntegration = true;
    nix-direnv.enable    = true;
  };

  home.packages = with pkgs; [
    # Actually useful
    ripgrep
    fd
    zip
    unzip
    mdr
    jq
    ffmpeg 
    imagemagick
    pandoc
    tree
    curlie
    btop
    yazi
    distrobox

    # Eye Candy
    hollywood
    fastfetch
    lavat
    asciiquarium
    cmatrix
    cbonsai
    pokeget-rs
  ];
}
