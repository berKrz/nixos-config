{ pkgs, ... }: {
	# Audio
	security.rtkit.enable = true; # priority to Pipewire -> avoids audio stuttering
	
	services.pipewire = {
		enable = true;
		
		alsa = {
			enable = true;
			support32Bit = true; # for 32 bit games
		};
		
		pulse.enable = true; # compatibility layer
		wireplumber.enable = true; # session manager
	};

	# Power
	services.upower.enable = true;
	
	environment.systemPackages = [ pkgs.brightnessctl ];
	
	services.auto-cpufreq = {
		enable = true;
		settings = {
			charger = {
				governor = "performance";
				turbo = "auto";
			};
			battery = {
				governor = "performance";
				turbo = "never";
			};
		};
	};
}
