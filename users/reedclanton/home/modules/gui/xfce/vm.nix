{ ... }: {
	imports = [
    # Configure flatpak.
    (if builtins.pathExists ../../applications/gui/flatpaks then ../../applications/gui/flatpaks else ../../../../../../do-nothing.nix)
    # Install some flatpak(s).
    ../../applications/gui/flatpaks/applications/brave.nix
    ../../applications/gui/flatpaks/applications/flatseal.nix
    ../../applications/gui/flatpaks/applications/libre-office.nix
    ../../applications/gui/flatpaks/applications/tor-browser-launcher.nix
    # Install some package(s).
    ../../applications/gui/packages/gedit.nix
    # Install some program(s).
    ../../applications/gui/programs/firefox.nix
	];
}
