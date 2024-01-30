{ ... }: {
	imports = [
		../../applications/gui
		../flatpak
		../flatpak/applications
	];

	wayland.windowManager.hyprland = {
		extraConfig = builtins.readFile ../../../config/hyprland/hyprland.conf;	
	};
}

