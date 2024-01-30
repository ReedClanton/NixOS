{ ... }: {
	imports = [
		../../applications/gui/firefox.nix
		../../applications/gui/gedit.nix
	];

	wayland.windowManager.hyprland = {
		extraConfig = builtins.readFile ../../../config/hyprland/hyprland.conf;	
	};
}

