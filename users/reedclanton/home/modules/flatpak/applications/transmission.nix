{ nix-flatpak, ... }: {
	services.flatpak.packages = [{ appId = "com.transmissionbt.Transmission"; origin = "flathub"; }];
}

