{ nix-flatpak, ... }: {
	services.flatpak.packages = [{ appId = "cc.arduino.IDE2"; origin = "flathub"; }];
}

