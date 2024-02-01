{ nix-flatpak, ... }: {
	services.flatpak.packages = [{ appId = "org.nickvision.tubeconverter"; origin = "flathub"; }];
}

