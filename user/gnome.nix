{ pkgs, ... }: {
  home.packages = with pkgs; [
    nautilus
    gnome-calculator
    gnome-disk-utility
    gnome-connections
    loupe
    file-roller
    baobab
    snapshot
    papers
  ];
}
