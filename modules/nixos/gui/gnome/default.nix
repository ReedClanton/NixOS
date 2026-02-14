{ pkgs, user, ... }: {
	services = {
    displayManager = {
#      gdm = {
#        enable = true;
#        wayland = true;
#      };
      autoLogin = {
        enable = true;
        user = user.name;
      };
    };
		# Ensure gnome-settings-daemon udev rules are enabled.
		udev.packages = with pkgs; [ gnome-settings-daemon ];
		xserver = {
			# Required by GDM.
			enable = true;
			displayManager = {
				gdm = {
					enable = true;
					wayland = true;
				};
			};
			# Enable Desktop Environment.
			desktopManager.gnome.enable = true;
			# Exclude default X11 packages I don't want.
			excludePackages = with pkgs; [ xterm ];
      xkb = {
        # Configure keymap in X11.
        layout = user.services.xserver.xkb.layout;
        variant = user.services.xserver.xkb.variant;
      };
		};
	};

	# TODO: Sort out if this is needed by firefox.
#	services.gnome.gnome-browser-connector.enable = true;

	# Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
	systemd.services."getty@tty1".enable = false;
	systemd.services."autovt@tty1".enable = false;

	environment = {
		# Remove part(s) of GNOME I don't want.
		gnome.excludePackages = (with pkgs; [
			gnome-photos
		]) ++ (with pkgs; [
			epiphany
			gnome-maps
			gnome-music
			totem
		]);

		# Install Gnome specific programs/package(s).
		systemPackages = with pkgs; [
      adwaita-icon-theme
      dconf-editor
			dconf2nix
			gnomeExtensions.appindicator
			xdg-desktop-portal-gnome
		];
	};
}

