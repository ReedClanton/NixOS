{ ... }: {
	imports = [
    # Configure flatpak.
    # TODO: Update with new path.
    ../../flatpak
    # Install some flatpak(s).
    # TODO: Update with new path.
    ../../flatpak/applications/brave.nix
    ../../flatpak/applications/flatseal.nix
    ../../flatpak/applications/libre-office.nix
    ../../flatpak/applications/tor-browser-launcher.nix
    # Install some package(s).
    ../../applications/gui/packages/gedit.nix
    # Install some program(s).
		../../applications/gui/programs/firefox.nix
	];

	wayland.windowManager.hyprland = {
		extraConfig = builtins.readFile ../../../config/hyprland/hyprland.conf;	
	};
}

