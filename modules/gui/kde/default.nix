{ pkgs, user, ... }: {
	services.xserver = {
		# Required by SDDM.
		enable = true;
		displayManager = {
			# `plasmawayland` forces Wayland, `plasma` forces X11.
#			defaultSession = lib.mkForce "plasmawayland";
			sddm = {
				enable = true;
				wayland.enable = true;
			};
			autoLogin = {
				enable = true;
				user = user.name;
			};
		};
		# Enable Desktop Environment.
		desktopManager.plasma5.enable = true;
		# Configure keymap in X11.
		layout = user.services.xserver.layout;
		xkbVariant = user.services.xserver.xkbVariant;
		# Exclude default X11 packages I don't want.
		excludePackages = with pkgs; [ xterm ];
	};

	environment = {
		# Remove part(s) of KDE I don't want.
#		plasma5.excludePackages = (with pkgs; [
			# NoOp
#		]) ++ (with pkgs.libsForQt5; [
			# NoOp
#		]);

		# Install KDE specific package(s).
		systemPackages = with pkgs.libsForQt5; [
			xdg-desktop-portal-kde
		];
	};
}

