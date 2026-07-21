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
				"SUPER,Return,spawn,kitty"
				"SUPER,c,killclient,"
			];
		};
	};
}
