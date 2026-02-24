{ pkgs, user, ... }: {
	services = {
    # Enable Desktop Environment.
    desktopManager.gnome.enable = true;
    displayManager = {
      autoLogin = {
        enable = true;
        user = user.name;
      };
      gdm = {
        enable = true;
        wayland = true;
      };
    };
		# Ensure gnome-settings-daemon udev rules are enabled.
		udev.packages = with pkgs; [ gnome-settings-daemon ];
		xserver = {
			# Required by GDM.
			enable = true;
			# Exclude default X11 packages I don't want.
			excludePackages = with pkgs; [ xterm ];
      xkb = {
        # Configure keymap in X11.
        layout = user.services.xserver.xkb.layout;
        variant = user.services.xserver.xkb.variant;
      };
		};
	};

	# Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
	systemd.services."getty@tty1".enable = false;
	systemd.services."autovt@tty1".enable = false;

	environment = {
		# Remove part(s) of GNOME I don't want.
		gnome.excludePackages = (with pkgs; [
      epiphany
			gnome-photos
      gnome-maps
      gnome-music
      gnome-software
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

