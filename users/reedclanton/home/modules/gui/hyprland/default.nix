{ config, pkgs, ... }: {
	wayland.windowManager.hyprland = {
		extraConfig = builtins.readFile ../../../config/hyprland/hyprland.conf;	
	};
}

