{ ... }: {
	# AMD CPU
	hardware.cpu.amd.updateMicrocode = true;

	# NVIDIA driver (proprietary)
	services.xserver.videoDrivers = [ "nvidia" ];
	hardware.nvidia = {
		open = false;
		modesetting.enable = true; # due to Wayland
		
		prime.offload = {
			enable = true;
			enableOffloadCmd = true;
		};
	};

	hardware.graphics.enable32Bit = true; # due to Steam/Proton + 32bit games
	
	hardware.bluetooth = {
		enable = true;
		powerOnBoot = false;
	};
	services.blueman.enable = true;
}
