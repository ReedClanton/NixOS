{ ... }: {
	imports = [
    # Configure flatpak.
    (if builtins.pathExists ../../applications/gui/flatpaks then ../../applications/gui/flatpaks else ../../../../../../do-nothing.nix)
    # Install all flatpak(s).
    (if builtins.pathExists ../../applications/gui/flatpaks/applications then ../../applications/gui/flatpaks/applications else ../../../../../../do-nothing.nix    )
    # Install all package(s).
    (if builtins.pathExists ../../applications/gui/packages then ../../applications/gui/packages else ../../../../../../do-nothing.nix)
    # Install all program(s).
    (if builtins.pathExists ../../applications/gui/programs then ../../applications/gui/programs else ../../../../../../do-nothing.nix)
	];
}
