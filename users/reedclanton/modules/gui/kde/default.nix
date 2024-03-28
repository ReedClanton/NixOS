{ ... }: {
	imports = [
    # Configure flatpak.
    (if builtins.pathExists ../../applications/gui/flatpaks/default.nix then ../../applications/gui/flatpaks else ../../../../../modules/applications/gui/flatpak)
    # Install all flatpak(s).
    (if builtins.pathExists ../../applications/gui/flatpaks/applications/default.nix then ../../applications/gui/flatpaks/applications else ../../../../../modules/applications/gui/flatpak/applications)
    # Install all package(s).
    (if builtins.pathExists ../../applications/gui/packages/default.nix then ../../applications/gui/packages else ../../../../../do-nothing.nix)
    # Install all program(s).
    (if builtins.pathExists ../../applications/gui/programs/default.nix then ../../applications/gui/programs else ../../../../../do-nothing.nix)
	];
}
