{ ... }: {
	imports = [
		./nix.nix
		./boot.nix
		./hardware.nix
		./networking.nix
		./audio.nix
		./power.nix
		./desktop.nix
		./users.nix
		./fonts.nix
		./gaming.nix
	];
}
