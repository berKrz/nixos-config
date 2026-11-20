{ pkgs, ... }: {
  programs.git = {
    enable = true;

    settings = {
      init.defaultBranch = "main";
    };

    includes = [
      { path = "~/.gitconfig.local"; }
    ];
  };

  programs.gh = {
    enable = true;

    settings = {
      git_protocol = "ssh";
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "*" = {
        AddKeysToAgent = "yes";
      };

      "github.com" = {
        IdentityFile = "~/.ssh/id_ed25519";
      };
    };
  };

  programs.vim = {
    enable = true;

    settings = {
      number = true;
    };

    extraConfig = ''
      syntax on
      set encoding=utf-8
    '';
  };

  home.packages = [
    pkgs.dbgate
  ];
}
