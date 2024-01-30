{ pkgs, ... }: {
	# Default system wide package(s).
	environment.systemPackages = with pkgs; [
		# Tool(s): NixOS #
		home-manager
		# Tool(s): System #
		rsync
		wget
		# Tool(s): Terminal #
		man-pages
		man-pages-posix
		neofetch
		# XDG #
		xdg-dbus-proxy
		xdg-desktop-portal
		xdg-user-dirs
		xdg-utils
	];
}

