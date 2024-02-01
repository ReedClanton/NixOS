{ nix-flatpak, ... }: {
	services.flatpak.packages = [{ appId = "org.freecadweb.FreeCAD"; origin = "flathub"; }];
}

