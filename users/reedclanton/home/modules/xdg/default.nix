{ config, pkgs, ... }: {
	xdg = {
		enable = true;
		mime.enable = true;
		mimeApps = {
			enable = true;
			associations.added = {
				"text/html" = [ "firefox.desktop" "org.gnome.gedit.desktop" ];
				"text/plain" = [ "org.gnome.gedit.desktop" ];
				"text/xml" = [ "firefox.desktop" "org.gnome.gedit.desktop" ];
				"x-scheme-handler/http" = [ "firefox.desktop" ];
				"x-scheme-handler/https" = [ "firefox.desktop" ];
			};
			defaultApplications = {
				# Firefox.
				"text/html" = [ "firefox.desktop" ];
				"x-scheme-handler/http" = [ "firefox.desktop" ];
				"x-scheme-handler/https" = [ "firefox.desktop" ];
				# Gedit.
				"text/plain" = [ "org.gnome.gedit.desktop" ];
				"text/xml" = [ "org.gnome.gedit.desktop" ];
			};
		};
		userDirs = {
			enable = true;
			createDirectories = true;
		};
	};
}

