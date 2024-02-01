{ nix-flatpak, ... }: {
	services.flatpak.packages = [{ appId = "us.zoom.Zoom"; origin = "flathub"; }];
}

