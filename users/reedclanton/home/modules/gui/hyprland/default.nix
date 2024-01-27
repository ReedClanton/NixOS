{ ... }: {
	imports = [
		../../applications/gui
	];

	wayland.windowManager.hyprland = {
		extraConfig = builtins.readFile ../../../config/hyprland/hyprland.conf;	
	};
}

