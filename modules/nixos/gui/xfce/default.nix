{ pkgs, user, ... }: {
	services.xserver = {
		enable = true;
		displayManager = {
      defaultSession = "xfce";
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
		desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        enableScreensaver = false;
        enableXfwm = true;
      };
    };
		# Configure keymap in X11.
		layout = user.services.xserver.layout;
		xkbVariant = user.services.xserver.xkbVariant;
		# Exclude default X11 packages I don't want.
		excludePackages = with pkgs; [ xterm ];
	};

  # Install XFCE specific programs/package(s).
	environment.systemPackages = with pkgs; [
		xdg-desktop-portal-xapp
	];

  # XFCE requires xdg portal configuration.
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-xapp ];
  };
}

