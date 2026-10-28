{ ... }: {
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 1000;
      save = 1000;
      ignoreDups = true;
      ignoreSpace = true;
    };

    shellAliases = {
      # Rebuild System
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-config#nix-btw";
      nfu = "cd ~/nixos-config && nix flake update";
      nfc = "cd ~/nixos-config && nix flake check";

      # Git
      gs = "git status";
      gc = "git commit";
      gp = "git push";

      ll = "ls -la";

      ff = "fastfetch";
    };

    initContent = ''
      function rice() {
          kitty --detach lavat -c 0000FF -k FF00FF -G -g
          kitty --detach cmatrix -C magenta -b
          kitty --detach cbonsai -l -i -k 165,23,200,30
          asciiquarium
        }

      function maya() {
        if [ -f /.distrobox ] || [ -n "$DISTROBOX_ENTER_PATH" ]; then
          QT_QPA_PLATFORM=xcb /usr/local/bin/maya "$@"
          return
        fi
        nohup distrobox enter --name maya -- bash -c '
          cd /opt/Autodesk/AdskLicensing/13.3.1.9694/AdskLicensingService/
          sudo ./AdskLicensingService &>/dev/null &
          sleep 2
          QT_QPA_PLATFORM=xcb /usr/local/bin/maya
        ' </dev/null &>/dev/null &
        disown $!
      }

      pokeget random --hide-name
    '';
  };
}
