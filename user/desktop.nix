{ pkgs, ... }: {
	wayland.windowManager.mango = {
		enable = true;
		autostart_sh = ''
			noctalia
			${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1
		'';

		settings = {
			xkb_rules_layout = "us";
			
			bind = [
				# Window Management
				"SUPER,Return,spawn,kitty"
				"SUPER,c,killclient,"
				"SUPER,f,fullscreen,"
				"SUPER_SHIFT,r,reload,"

				# Focus
				"SUPER,h,focusdir,left"
				"SUPER,j,focusdir,up"
				"SUPER,j,focusdir,down"
				"SUPER,l,focusdir,right"

				# Move Windows
				"SUPER_SHIFT,h,movewindow,left"
				"SUPER_SHIFT,j,movewindow,up"
				"SUPER_SHIFT,j,movewindow,down"
				"SUPER_SHIFT,l,movewindow,right"

				# Tags 1-9
				"SUPER,1,viewtag,1"
				"SUPER,2,viewtag,2"
				"SUPER,3,viewtag,3"
				"SUPER,4,viewtag,4"
				"SUPER,5,viewtag,5"
				"SUPER,6,viewtag,6"
				"SUPER,7,viewtag,7"
				"SUPER,8,viewtag,8"
				"SUPER,9,viewtag,9"
				
				# Noctalia IPC
				"SUPER,space,spawn, noctalia msg panel-toggle launcher"
				"SUPER,ESC,spawn, noctalia msg panel-toggle control-center"
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
}
