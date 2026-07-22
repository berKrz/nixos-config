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
		};
	};
}
