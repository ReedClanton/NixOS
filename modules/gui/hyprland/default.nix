{ inputs, pkgs, ... }: {
	imports = [
		../default.nix
	];

	programs.hyprland = {
		enable = true;
		package = inputs.hyprland.packages.${pkgs.system}.hyprland;
		xwayland.enable = true;
	};

	environment = {
		# Don't really know why, or if, this is really needed...
		sessionVariables = {
			WLR_NO_HARDWARE_CURSORS = "1";
			WLR_RENDERER_ALLOW_SOFTWARE= "1"; 
		};
		# Install Hyprland specific package(s).
		systemPackages = with pkgs; [
			gtk3
			# Kitty stuff.
			kitty
			kitty-img
			kitty-themes
			termpdfpy
			mako
			libsForQt5.dolphin
			libsForQt5.polkit-kde-agent
			libsForQt5.kwayland-integration
			libsForQt5.plasma-wayland-protocols
			libsForQt5.qt5.qtwayland
			qt6.qtwayland
			wofi
			xdg-desktop-portal-hyprland
		];
	};
}

