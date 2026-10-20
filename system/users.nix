{ pkgs, ... }: {
  programs.zsh.enable = true;

  users.users.berkrz = {
    isNormalUser = true;
    home = "/home/berkrz";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "input" "podman" "docker" ];
    subUidRanges = [{ startUid = 100000; count = 65536; }];
    subGidRanges = [{ startGid = 100000; count = 65536; }];
  };
}
