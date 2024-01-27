{ pkgs, user, ... }: {
	imports = [
		../default.nix
	];

	services.xserver = {
		# Enable the X11 windowing system (for some reason this is needed to enable wayland).
		enable = true;
		displayManager = {
			sddm = {
				enable = true;
#				autoLogin.relogin = true;
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

