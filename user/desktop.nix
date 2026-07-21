{ pkgs, ... }: {
	wayland.windowManager.mango = {
		enable = true;
		autostart_sh = ''
			${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1
		'';

		settings = {
			xkb_rules_layout = "us";
			
			bind = [
				# Window Management
				"SUPER,Return,spawn,kitty"
				"SUPER,c,killclient,"
				"SUPER,f,togglefullscreen,"
				"SUPER+SHIFT,r,reload_config,"

				# Focus
				"SUPER,h,focusdir,left"
				"SUPER,k,focusdir,up"
				"SUPER,j,focusdir,down"
				"SUPER,l,focusdir,right"

				# Move Windows
				"SUPER+SHIFT,h,exchange_client,left"
				"SUPER+SHIFT,k,exchange_client,up"
				"SUPER+SHIFT,j,exchange_client,down"
				"SUPER+SHIFT,l,exchange_client,right"

				# Tags 1-9
				"SUPER,1,tag,1"
				"SUPER,2,tag,2"
				"SUPER,3,tag,3"
				"SUPER,4,tag,4"
				"SUPER,5,tag,5"
				"SUPER,6,tag,6"
				"SUPER,7,tag,7"
				"SUPER,8,tag,8"
				"SUPER,9,tag,9"
				
				"SUPER+SHIFT,1,view,1"
				"SUPER+SHIFT,2,view,2"
				"SUPER+SHIFT,3,view,3"
				"SUPER+SHIFT,4,view,4"
				"SUPER+SHIFT,5,view,5"
				"SUPER+SHIFT,6,view,6"
				"SUPER+SHIFT,7,view,7"
				"SUPER+SHIFT,8,view,8"
				"SUPER+SHIFT,9,view,9"

				# Noctalia IPC
				"SUPER,space,spawn, noctalia msg panel-toggle launcher"
				"SUPER,Escape,spawn, noctalia msg panel-toggle control-center"
				"SUPER,v,spawn, noctalia msg panel-toggle clipboard"
				"SUPER,BackSpace,spawn, noctalia msg panel-toggle session"

				# Audio
				"NONE,XF86AudioRaiseVolume,spawn,noctalia msg volume-up"
				"NONE,XF86AudioLowerVolume,spawn,noctalia msg volume-down"
				"NONE,XF86AudioMute,spawn,noctalia msg volume-mute"

				# Video
				"NONE,XF86MonBrightnessUp,spawn,noctalia msg brightness-up"
				"NONE,XF86MonBrightnessDown,spawn,noctalia msg brightness-down"
			];
		};
	};

	programs.noctalia = {
		# Noctalia as a Systemd user service
		systemd.enable = true;

		settings = builtins.fromTOML(builtins.readFile ./noctalia/config.toml);
	};
}
