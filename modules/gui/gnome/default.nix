{ pkgs, user, ... }: {
	services = {
		# Ensure gnome-settings-daemon udev rules are enabled.
		udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
		xserver = {
			# Required by GDM.
			enable = true;
			displayManager = {
				# `gnome` forces Wayland, `gnome-xorg` forces X11.
#				defaultSession = lib.mkForce "gnome";
				gdm = {
					enable = true;
					wayland = true;
				};
				autoLogin = {
					enable = true;
					user = user.name;
				};
			};
			# Enable Desktop Environment.
			desktopManager.gnome.enable = true;
			# Configure keymap in X11.
			layout = user.services.xserver.layout;
			xkbVariant = user.services.xserver.xkbVariant;
			# Exclude default X11 packages I don't want.
			excludePackages = with pkgs; [ xterm ];
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
		]) ++ (with pkgs.gnome; [
			epiphany
			gnome-maps
			gnome-music
			totem
		]);

		# Install Gnome specific programs/package(s).
		systemPackages = with pkgs; [
			dconf2nix
			gnome.adwaita-icon-theme
			gnome.dconf-editor
			gnomeExtensions.appindicator
			xdg-desktop-portal-gnome
		];
	};
}

