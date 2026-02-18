{ inputs, pkgs, user, ... }: {
	programs = {
    hyprland = {
		  enable = true;
		  package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      # Launch Hyprland with the Universal Wayland Session Manager (UWSM). This has improved systemd
      # support. This automatically starts appropiate targets like `graphical-session.target`
      # & `wayland-session@Hyprland.target`.
      withUWSM = true;
		  xwayland.enable = true;
    };
    # Enables Universal Wayland Session Manager (UWSM) which wraps standalone Wayland
    # compositors with a set of systemd units on the fly. This essentially binds the wayland
    # compositor into `graphical-session-pre.target`, `graphical-session.target`,
    # & `xdg-desktop-autostart.target`.
    # Note(s):
    #   - If having trouble starting a service that depends on `graphical-session.target`,
    #     enabling this might help.
    uwsm.enable = true;
	};

	environment = {
		# Don't really know why, or if, this is really needed...
		sessionVariables = {
			WLR_NO_HARDWARE_CURSORS = "1";
			WLR_RENDERER_ALLOW_SOFTWARE= "1";
		};
		# Install Hyprland specific package(s).
		systemPackages = with pkgs; [
      ## App Launcher ##
      hyprlauncher
      ## Clipboard ##
      wl-clipboard
      ## File Manager ##
      kdePackages.dolphin
      ## Notification Daemon ##
      mako
      ## Status Bar ##
      # Handled by home-manager.
      ## Terminal ##
      kitty
      ## XDG ##
      xdg-desktop-portal-hyprland
      ## Wallpaper ##
      hyprpaper
      ## Everything Else ##
      gtk3
      kdePackages.kwayland-integration
      kdePackages.plasma-wayland-protocols
      kdePackages.polkit-kde-agent-1
      kdePackages.qtwayland
			kitty-img
			kitty-themes
      qt6.qtwayland
			termpdfpy
		];
	};
}

