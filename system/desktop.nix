{ pkgs, ... }: {
	# Auth daemon
	security.polkit.enable = true;

	# Settings DB used for GNOME apps
	programs.dconf.enable = true;

	services.gnome.gnome-keyring.enable = true;

	# Two backends are necessary for wlroots compositors
	xdg.portal = {
		enable = true;
		wlr.enable = true; # for screen sharing and screenshots
		extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; # file picker, app chooser etc. 
		config.common = {
			default = "gtk";
			"org.freedesktop.impl.portal.ScreenCast" = "wlr";
			"org.freedesktop.impl.portal.Screenshot" = "wlr";
		};
	};
}
