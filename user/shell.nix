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
      nru = "cd ~/nixos-config && nix flake update && sudo nixos-rebuild switch --flake ~/nixos-config#nix-btw";
    	
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

      pokeget random --hide-name
    '';
 };
}
