{ ... }: {
	imports = [
		../../applications/gui/firefox.nix
		../../applications/gui/gedit.nix
		../flatpak
		../flatpak/applicaitons/brave.nix
		../flatpak/applicaitons/flatseal.nix
		../flatpak/applicaitons/libreoffice.nix
		../flatpak/applicaitons/torbrowser.nix
	];

	wayland.windowManager.hyprland = {
		extraConfig = builtins.readFile ../../../config/hyprland/hyprland.conf;	
	};
}

