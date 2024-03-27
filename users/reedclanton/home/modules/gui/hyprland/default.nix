{ ... }: {
	imports = [
    # Configure flatpak.
    (if builtins.pathExists ../../applications/gui/flatpak then ../../applications/gui/flatpak else ../../../../../../do-nothing.nix)
    # Install all flatpak(s).
    (if builtins.pathExists ../../applications/gui/flatpak/applications then ../../applications/gui/flatpak/applications else ../../../../../../do-nothing.nix)
    # Install all package(s).
    (if builtins.pathExists ../../applications/gui/packages then ../../applications/gui/packages else ../../../../../../do-nothing.nix)
    # Install all program(s).
    (if builtins.pathExists ../../applications/gui/programs then ../../applications/gui/programs else ../../../../../../do-nothing.nix)
    # TODO: Remove.
		../../flatpak
    # TODO: Remove.
		../../flatpak/applications
	];

	wayland.windowManager.hyprland = {
		extraConfig = builtins.readFile ../../../config/hyprland/hyprland.conf;	
	};
}

