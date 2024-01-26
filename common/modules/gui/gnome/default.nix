{ inputs, config, pkgs, lib, user, ... }: {
	imports = [
		../default.nix
	];

	services = {
		# Ensure gnome-settings-daemon udev rules are enabled.
		udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
		xserver = {
			# Enable the X11 windowing system (for some reason this is needed to enable wayland).
			enable = true;
			# Enable the GNOME Desktop Environment.
			displayManager = {
				gdm = {
					enable = true;
					wayland = true;
				};
				# Enable automatic login.
				autoLogin = {
					enable = true;
					user = user.name;
				};
			};
			# Enable VE.
			desktopManager.gnome.enable = true;
			# Configure keymap in X11.
			layout = user.services.xserver.layout;
			xkbVariant = user.services.xserver.xkbVariant;
			# Exclude default packages I don't want.
			excludePackages = with pkgs; [ xterm ];
		};
	};

	# TODO: Sort out if this is needed by firefox.
#	services.gnome.gnome-browser-connector.enable = true;

	# Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
	systemd.services."getty@tty1".enable = false;
	systemd.services."autovt@tty1".enable = false;

	environment = {
		# Remove part(s) of Gnome I don't want.
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

