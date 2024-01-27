{ inputs, config, pkgs, user, ... }: {
	imports = [
		../default.nix
	];

	services.xserver = {
		# Enable the X11 windowing system (for some reason this is needed to enable wayland).
		enable = true;
		# Enable the GNOME Desktop Environment.
		displayManager = {
			sddm = {
				enable = true;
#				autoLogin.relogin = true;
				wayland.enable = true;
			};
			# Enable automatic login.
			autoLogin = {
				enable = true;
				user = user.name;
			};
		};
		# Enable VE.
		desktopManager.plasma5.enable = true;
		# Configure keymap in X11.
		layout = user.services.xserver.layout;
		xkbVariant = user.services.xserver.xkbVariant;
		# Exclude default packages I don't want.
		excludePackages = with pkgs; [ xterm ];
	};

	environment = {
		# Remove part(s) of KDE I don't want.
#		plasma5.excludePackages = (with pkgs; [
#			# NoOp
#		]) ++ (with pkgs.libsForQt5; [
#			# NoOp
#		]);

		# Install KDE specific programs/package(s).
		systemPackages = with pkgs.libsForQt5; [
			xdg-desktop-portal-kde
		];
	};
}

