{ pkgs, ... }: {
  programs.zsh.enable = true;

  users.users.berkrz = {
    isNormalUser = true;
    home = "/home/berkrz";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "input" ];
  };
}
