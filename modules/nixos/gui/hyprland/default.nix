{ inputs, pkgs, ... }: {
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
      hyprlauncher
      hyprpaper
      kdePackages.dolphin
      kdePackages.kwayland-integration
      kdePackages.plasma-wayland-protocols
      kdePackages.polkit-kde-agent-1
      kdePackages.qtwayland
			# Kitty stuff.
			kitty
			kitty-img
			kitty-themes
      mako
      qt6.qtwayland
			termpdfpy
      waybar
      wl-clipboard
			wofi
			xdg-desktop-portal-hyprland
		];
	};
}

