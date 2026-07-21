{ ... }: {
	imports = [
		./nix.nix
		./boot.nix
		./hardware.nix
		./networking.nix
		./services.nix
		./desktop.nix
		./users.nix
		./fonts.nix
		./gaming.nix
	];
}
