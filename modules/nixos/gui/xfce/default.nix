{ pkgs, user, ... }: {
  services = {
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
    xserver = {
      enable = true;
      # Enable Desktop Environment.
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          enableScreensaver = false;
          enableXfwm = true;
        };
      };
      # Exclude default X11 packages I don't want.
      excludePackages = with pkgs; [ xterm ];
      # Configure keymap in X11.
      xkb = {
        layout = user.services.xserver.xkb.layout;
        variant = user.services.xserver.xkb.variant;
      };
    };
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

