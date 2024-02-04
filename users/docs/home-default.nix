{ pkgs, config, user, ... }: {
	imports = [
		<homeManagerModulesHere>
	];

	home = {
		# This value determines the Home Manager release that your configuration is
		# compatible with. This helps avoid breakage when a new Home Manager release
		# introduces backwards incompatible changes.
		#
		# You should not change this value, even if you update Home Manager. If you do
		# want to update the value, then make sure to first check the Home Manager
		# release notes.
		stateVersion = "<nixMajorVersion>.<nixMinorVersion>"; # Ex: "23.11"
		username = user.name;
		homeDirectory = user.home;
		shellAliases = user.shell.aliases;

		sessionVariables = {
			# TODO: Test! Doesn't seem like just setting these worked.
			# Removes `.gnupg/` from home.
			GNUPGHOME = "${config.xdg.dataHome}/gnupg";
			# Removes `.gtkrc-2.0` from home.
			GTK2_RC_FILES="${config.xdg.configHome}/gtk-2.0/gtkrc";
			# Removes `.compose-cache/` from home.
			XCOMPOSECACHE="${config.xdg.cacheHome}/X11/xcompose";
		};

		file = {
			".ssh/.keep".text = "Home Manager can only create directories that contain something. Thus in order for Home Manager to creation the directory this file is in, a file must be created in it. Hense the existice of this file.";
			"${config.xdg.configHome}/sops/age/.keep".text = "Home Manager can only create directories that contain something. Thus in order for Home Manager to creation the directory this file is in, a file must be created in it. Hense the existice of this file.";
		};
	};

	xdg = {
		enable = true;
		mime.enable = true;
		mimeApps = {
			enable = true;
			associations.added = {
				"text/html" = [ "<browser>" "<textEditor>" ];
				"text/plain" = [ "<textEditor>" ];
				"text/xml" = [ "<browser>" "<textEditor>" ];
				"x-scheme-handler/http" = [ "<browser>" ];
				"x-scheme-handler/https" = [ "<browser>" ];
			};
			defaultApplications = {
				# Firefox.
				"text/html" = [ "<browser>" ];
				"x-scheme-handler/http" = [ "<browser>" ];
				"x-scheme-handler/https" = [ "<browser>" ];
				# Gedit.
				"text/plain" = [ "<textEditor>" ];
				"text/xml" = [ "<textEditor>" ];
			};
		};
		userDirs = {
			enable = true;
			createDirectories = true;
		};
	};

	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}
