{ ... }: {
	imports = [
    # Configure flatpak.
    (if builtins.pathExists ../../applications/gui/flatpaks/default.nix then ../../applications/gui/flatpaks else ../../../../../../modules/applications/gui/flatpak)
    # Install some flatpak(s).
    ../../applications/gui/flatpaks/applications/brave.nix
    ../../applications/gui/flatpaks/applications/libre-office.nix
    ../../applications/gui/flatpaks/applications/tor-browser-launcher.nix
    # Install some package(s).
    ../../applications/gui/packages/gedit.nix
    # Install some program(s).
    ../../applications/gui/programs/firefox.nix
	];
}
