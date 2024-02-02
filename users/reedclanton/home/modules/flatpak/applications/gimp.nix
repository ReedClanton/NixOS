{ nix-flatpak, ... }: {
	services.flatpak.packages = [{ appId = "org.gimp.GIMP"; origin = "flathub"; }];
}

