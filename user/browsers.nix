{ pkgs, inputs, ... }: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition;
  }; 

  home.packages = [
    inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
