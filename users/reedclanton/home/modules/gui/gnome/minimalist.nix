{ ... }: {
	imports = [
		../../applications/gui/firefox.nix
		../../applications/gui/gedit.nix
		./dconf
		../flatpak
		../flatpak/applications/brave.nix
		../flatpak/applications/flatseal.nix
		../flatpak/applications/libreoffice.nix
		../flatpak/applications/torbrowser.nix
	];
}
