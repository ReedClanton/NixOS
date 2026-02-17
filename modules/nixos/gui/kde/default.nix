{ pkgs, user, ... }: {
  services = {
    # Enable Desktop Environment.
    desktopManager.plasma6.enable = true;
    displayManager = {
      autoLogin = {
        enable = true;
        user = user.name;
      };
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
    xserver = {
      # Required by SDDM.
      enable = true;
      # Exclude default X11 packages I don't want.
      excludePackages = with pkgs; [ xterm ];
      # Configure keymap in X11.
      xkb = {
        layout = user.services.xserver.xkb.layout;
        variant = user.services.xserver.xkb.variant;
      };
    };
  };

	environment = {
		# Remove part(s) of KDE I don't want.
#		plasma6.excludePackages = (with pkgs; [
			# NoOp
#		]) ++ (with pkgs.libsForQt5; [
			# NoOp
#		]);

		# Install KDE specific package(s).
		systemPackages = with pkgs.kdePackages; [
			xdg-desktop-portal-kde
		];
	};
}

