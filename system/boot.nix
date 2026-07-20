{ ... }: {
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	zramSwap.enable = true;

	time.timeZone = "America/Sao_Paulo";
	i18n.defaultLocale = "en_US.UTF-8";

	# Alternative keyboard
	console.keyMap = "us";
}
